<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\CommodityModel;
use app\admin\service\StockService;
use cmf\controller\AdminBaseController;
use think\Exception;
use think\Request;
use think\Session;
use think\Db;
use app\admin\service\ProcessService;
use PHPExcel_IOFactory;
use cmf\phpqrcode\QRcode;

class SysController extends AdminBaseController
{
    private $userid = null;
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        //$user = cmf_get_current_user();
        $this->userid = cmf_get_current_admin_id();
    }

    public function idnex(){
            echo "sss";
    }

    /*
     * 我的订单
     * */

    public function myOrder(){
        $userid = $this->userid;
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        $Sku = $this->request->param("Sku");
        //$process = Db::name("process")->where(["userid"=>$user])->select();
        if($ErpOrderDetailNo){
            $where = "a.userid ='".$userid."' and b.ErpOrderDetailNo like '%$ErpOrderDetailNo%' and (a.status=0 or a.status=3)";
        }else{
            $where = "a.userid ='".$userid."' and (a.status=0 or a.status=3)";
            //$where = ["a.userid"=>$userid,"a.status"=>0];
        }
        if($Sku){
            $where .= " and b.Sku like '%$Sku%'";
        }
        $user = Db::name("role_user")->where("role_id in ('3','7','10','11','12','22') and user_id='$userid'")->find();
        if($user["role_id"] == 10){//如果是做大底员工 按颜色和楦型排序
            $where .= " and b.start_status=1";
            $task = Db::name("task")
                ->alias("a")
                ->field("a.*,b.ErpOrderDetailNo,b.start_status,b.product_mark")
                ->join("process b","a.process_id=b.id","left")
                ->join("productionlist c","b.ErpOrderDetailNo = c.ErpOrderDetailNo")
                ->order("c.Bottom asc,c.ShoeLast asc")
                ->where($where)->paginate(10);
        }else{
            $task = Db::name("task")
                ->alias("a")
                ->field("a.*,b.ErpOrderDetailNo,b.start_status,b.product_mark")
                ->join("process b","a.process_id=b.id","left")
                ->order("a.process_id asc")
                ->where($where)->paginate(10);
        }
        //echo  Db::name("task")->getLastSql();die;
        $type = processname();
        $this->assign('type', $type);
        //echo Db::name("role_user")->getLastSql();
        //var_dump($user);die;
        if($user){
            $string= [];
            foreach ($task as $key => $val){
                $string[] = $val['ErpOrderDetailNo'];
            }
            $condition = join("','",$string);
            if($condition){
                $sql =   "select a.*,b.*,c.Reason as Urgent from OrderDetail a left join Commodity b on a.CommodityId = b.Id left join UrgentOrderDetail c on a.ErpOrderDetailNo=c.ErpOrderDetailNo  WHERE a.ErpOrderDetailNo in('$condition')";
                $data  = sqlServer($sql);
                //var_dump($data);die;
                foreach ($data as $key => $val){
                    $te = explode(",",$val["Image"]);
                    if($user["role_id"] == 11){
                        $data["$key"]["Image"] = [$te[0]];
                    }else{
                        $data["$key"]["Image"] = $te;
                    }
                }
                //var_dump($data);die;
                foreach ($task as $ke => $va){
                    foreach ($data as $k => $v){
                        if($va['ErpOrderDetailNo'] == $v["ErpOrderDetailNo"]){
                            $task[$ke] = array_merge($task[$ke],$v);
                            //var_dump($task[$ke]);exit;
                           // $task[$ke][] = $v;
                        }
                    }
                }
            }

            $this->assign('data', $task);
            //var_dump($task);
            if($user["role_id"] == 3){
                return $this->fetch("examinePaper");
            }
            if($user["role_id"] == 7){
                return $this->fetch("examinePaperbottom");
            }
            if($user["role_id"] == 10){
                return $this->fetch("outsole");
            }
            if($user["role_id"] == 11){
                return $this->fetch("midsole");
            }
            if($user["role_id"] == 22){
                return $this->fetch("accessories");
            }
            if($user["role_id"] == 12){
                return $this->fetch("totalmixedIngredients");
            }
        }
        $this->assign('data', $task);
        return $this->fetch();
    }

    /*
     * 确认订单
     * */
    public function confirmation (){
        $id = $this->request->param("id");
        if($id){
            $userid = $this->userid;
            $time = date("Y-m-d H:i:s");
            if($re = Db::name("task")->where(["id"=>$id,"userid"=>$userid])->update(["status"=>3,"confirm_time"=>$time])){
                return json(["code"=>200,"msg"=>"确认成功"]);
            }else{
                return json(["code"=>500,"msg"=>"确认失败，这不是你的任务"]);
            }
        }else{
            return json(["code"=>500,"msg"=>"确认失败，参数错误"]);
        }
    }
    /*
     * 订单详情
     * para:
     *      id : 内部订单号
     * */

    public function orderdetail(){
        if($id = $this->request->param("id")){
            $taskid = $this->request->param("taskid");
            $task = Db::name("task")->where(["id"=>$taskid])->find();
            $sql = "select a.*,b.* from OrderDetail a left join Commodity b on a.CommodityId = b.Id WHERE a.ErpOrderDetailNo='$id'";
            $data = sqlServer($sql);
            foreach ($data as $key => $val){
                $te = explode(",",$val["Image"]);
                $data["$key"]["Image"] = $te;
            }
            $info = Db::name("commodityinfo")->where(["commodityid"=>$data[0]["CommodityId"]])->find();
            $this->assign('task_type', $task["task_type"]);
            $this->assign('task_info', $task);
            if($task["task_type"] == "mixedIngredients" || $task["task_type"] == "distributionBlanking"){
                $user = Db::name("user")->alias("a")
                    ->field("a.user_nickname,a.id,a.user_login,b.role_id")
                    ->join("role_user b","a.id=b.user_id","left")
                    ->where(["b.role_id"=>17])
                    ->select();
                $this->assign('handuser', $user);
            }

            $hand = Db::name("handwork")->where(["taskid"=>$taskid])->select();
            $this->assign('handwork', $hand);
            $product_mark = Db::name("process")->field("product_mark")->where(["ErpOrderDetailNo"=>$id])->find();
            $this->assign('product_mark',$product_mark["product_mark"]);
            $this->assign('taskid', $taskid);
            $this->assign('info', $info);
            $this->assign('data', $data);
            //var_dump($data);die;
            $nexttask = "";
            $type = $this->request->param("type") ;
            if($type &&  $type=="edit"){
                $next = process($task["task_type"]);
                $nexttask = Db::name("task")->alias("a")->field("a.task_type,b.user_login,b.user_nickname")->join("user b","a.userid=b.id","left")->where(["task_type"=>$next,"process_id"=>$task["process_id"]])->find();
                $this->assign('nexttask', $nexttask);
                //echo Db::name("task")->getLastSql();
                return $this->fetch();
            }
            $this->assign('nexttask', $nexttask);
            /*switch ($task["task_type"]){
                case "examinePaperbottom"://鞋底审单
                    return $this->fetch("examinePaperbottom");break;
                case "examinePaper"://鞋面审单
                    return $this->fetch("examinePaper");break;
                default:
                    return $this->fetch();break;
            }*/
            /*if($task["task_type"] == "examinePaperbottom"){
                return $this->fetch("examinePaperbottom");
            }*/
            /*if(isMobile()){
                return $this->fetch("wap/orderdetail");
            }*/
            return $this->fetch();
        }
    }

    /*
     * 添加手工
     * */
    public function byhand(){
        $handworktype = $this->request->param("handworktype");
        $taskid  = $this->request->param("taskid");
        $work  = $this->request->param("work");
        if($handworktype && $taskid && $work) {
            $data["handworktype"] = $handworktype;
            $data["taskid"] = $taskid;
            $data["userid"] = $this->userid;
            $data["accept_user"] = $this->userid;
            if($handworktype == "外部手工"){
                $data["work"] = $work;
            }
            if ($re = Db::name("handwork")->insert($data)) {
                return json(["code" => 200, "msg" => "添加成功"]);
            } else {
                return json(["code" => 500, "msg" => "添加失败"]);
            }


        }
    }
/*
 * 编辑手工价格
 * */
    public function editbyhand(){
        //$handworktype = $this->request->param("handworktype");
        $id  = $this->request->param("id");
        //$work  = $this->request->param("work");
        $status = $this->request->param("status");
        if($id && isset($status) ) {
            $data["status"] = $status;
            if($status == "2"){
                $re = Db::name("handwork")->where(['id' => $id])->delete();
            }else{
                if($status == 1){
                    $data["finish_time"] = date("Y-m-d H:i:s");
                }
                $re = Db::name("handwork")->where(['id' => $id])->update($data);
            }
            if ($re) {
                return json(["code" => 200, "msg" => "修改成功"]);
            } else {
                return json(["code" => 500, "msg" => "修改失败"]);
            }
        }
    }
    /*
     * 已经完成任务
     * */
    public function finishtask(){
        $uid = $this->userid;
        $where = ["a.userid"=>$uid,"a.status"=>1];
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        if($ErpOrderDetailNo){
            $where["ErpOrderDetailNo"] = ["like","%$ErpOrderDetailNo%"];
        }
        $start_time = $this->request->param("start_time");
        $end_time = $this->request->param("end_time");
        if($start_time){
            $where["a.finish_time"][] = [">","$start_time"];
            if($end_time){
                $where["a.finish_time"][] = ["<","$end_time"];
            }
        }
        //var_dump($where);die;
        /*$arr = group();
        $user = Db::name("role_user")->alias("a")->field("role_id,user_id")->join("role b","a.role_id=b.id","left")->where(["a.user_id"=>$uid,"b.status"=>1])->find();
        $key = array_search($user["role_id"],$arr);
        $next = process($key);
        $where["c.task_type"] =$next;*/
        $task = Db::name("task")
            ->alias("a")
            ->field("a.*,b.ErpOrderDetailNo")
            ->join("process b","a.process_id=b.id","left")
           /* ->join("task c","a.process_id=c.process_id","left")*/
            ->where($where)->order("a.finish_time desc")->paginate(10);
        //echo  Db::name("task")->getLastSql();die;
        $user = session('ADMIN_USER_NAME');
        //$this->assign('pages', $task->items());
        $type = processname();
        $this->assign('type', $type);
        $this->assign('pages', $task);
        return $this->fetch();
    }
    /*
     * 已经取消任务
     * */
    public function deletetask(){
        $uid = $this->userid;
        $where = ["a.userid"=>$uid,"a.status"=>2];
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        if($ErpOrderDetailNo){
            $where["b.ErpOrderDetailNo"] = ["like","%$ErpOrderDetailNo%"];
        }
        $start_time = $this->request->param("start_time");
        $end_time = $this->request->param("end_time");
        if($start_time){
            $where["a.addtime"][] = [">","$start_time"];
            if($end_time){
                $where["a.addtime"][] = ["<","$end_time"];
            }
        }
        $task = Db::name("task")
            ->alias("a")
            ->field("a.*,b.ErpOrderDetailNo,b.start_status")
            ->join("process b","a.process_id=b.id","left")
            ->where($where)->order("b.id desc")->paginate(10);

        $user = session('ADMIN_USER_NAME');
        //$this->assign('pages', $task->items());
        $type = processname();
        $this->assign('type', $type);
        $this->assign('pages', $task);
        //var_dump($task);
        return $this->fetch();
    }

    /*
     * 我的任务完成更改状态
     * */
    public function finishorder(){
        $id = $this->request->param("id");
        /*流程信息*/
        $process = Db::name("task")->field("a.id,a.userid,a.process_id,a.task_type,a.status,b.CommodityId,a.is_purchase")
                    ->alias("a")
            ->join("process b","a.process_id=b.id","left")
            ->where(["a.id"=>$id,"a.userid"=>$this->userid])->find();
        if($process["status"] != 0 && $process["status"] != 3){
            return json(["code"=>500,"msg"=>"任务状态已经更换"]);
        }
        if($process["is_purchase"]  == 1){
            return json(["code"=>500,"msg"=>"该任务还有未完成的采购"]);
        }
        /*如果当前流程是开板或者描版，那么查询是否上传对应的文件或信息，如果上传了才能完成当前任务，并且进入下一流程*/
        if(/*$process["task_type"] == "openboard" || */$process["task_type"] == "tracing"){
            $info = Db::name("commodityinfo")->where(["commodityid"=>$process["CommodityId"]])->find();
            /*if(!$info["openboard"] && $process["task_type"] == "openboard"){
                return json(["code"=>500,"msg"=>"请先上传开板信息"]);
            }*/
            if((!$info["tracing"] || !$info["3Dmodel"]) && $process["task_type"] == "tracing"){
                return json(["code"=>500,"msg"=>"请先上传描版文件"]);
            }
        }
        //当前为配料下料
        if($process["task_type"] == "distributionBlanking"){
            //$mixedIngredients = $this->request->param("mixedIngredients");
            return ProcessService::finishDistributionBlanking($process["process_id"],$process["id"] /*,$mixedIngredients*/);
        }
        if($process["task_type"] == "accessories"){
            return ProcessService::finishaccessories($process["process_id"],$process["id"]);
        }
        //当前为鞋面审单
        if($process["task_type"] == "examinePaper"){
            $openboard =$this->request->param("openboard");
            Db::startTrans();
            try{
                ProcessService::finishProcess($process["process_id"],$process["task_type"]);//完成流程表对应的当前任务
                ProcessService::finishTask($process["id"]);//完成当前任务表中的对应的任务
                $next = process("examinePaper");
                if(isset($openboard) && $openboard == "1"){
                    $next = "openboard";
                    Db::name("process")->where(["id"=>$process["process_id"]])->update(["openboard"=>0]);
                    Db::name("process")->where(["id"=>$process["process_id"]])->update(["tracing"=>0]);
                }else{
                    Db::name("process")->where(["id"=>$process["process_id"]])->update(["openboard"=>2]);
                    Db::name("process")->where(["id"=>$process["process_id"]])->update(["tracing"=>2]);
                }
                ProcessService::startProcess($process["process_id"],$next);//开始流程的下一个任务
                Db::commit();
            }catch (\ErrorException $e){
                Db::rollback();
                return ["status"=>500,"msg"=>"任务完成失败！"];
            }
            return ["status"=>200,"msg"=>"任务处理完成！"];
        }
        //如果当前为下料或者面部审单则需要更改手工表中手工状态
        /*if($process["task_type"] == "mixedIngredients" || $process["task_type"] == "examinePaper"){
            if(Db::name("handwork")->where(["taskid"=>$id])->find()){
                Db::name("handwork")->where(["taskid"=>$id])->update(["status"=>1]);
            }
        }*/
        if($process["task_type"] == "makeFace"){
            if(Db::name("handwork")->where(["taskid"=>$id,"status"=>0])->find()){
                return ["status"=>500,"msg"=>"该任务有手工没有完成！"];
            }
        }
        //当前流程是鞋底审单，则下一流程为3D,开楦，做大底，做中底
        if($process["task_type"] == "examinePaperbottom"){
            Db::startTrans();
            try {
                if ($threeD = $this->request->param("threeD")) {
                    $sta = ProcessService::startProcess($process["process_id"], "threeD");
                    ProcessService::modifyprocess($process["process_id"], "threeD",0);
                    if(!$sta["status"]){
                        Db::rollback();
                        return json(["code"=>500,"msg"=>$sta["msg"]]);
                    }
                }else{
                    Db::name("process")->where(["id"=>$process["process_id"]])->update(["threeD"=>2]);
                }
                if ($last = $this->request->param("last")) {
                    $sta = ProcessService::startProcess($process["process_id"], "last");
                    ProcessService::modifyprocess($process["process_id"], "last",0);
                    if(!$sta["status"]){
                        Db::rollback();
                        return json(["code"=>500,"msg"=>$sta["msg"]]);
                    }
                }else{
                    Db::name("process")->where(["id"=>$process["process_id"]])->update(["last"=>2]);
                }
                ProcessService::startProcess($process["process_id"], "outsole");
                ProcessService::startProcess($process["process_id"], "midsole");
                Db::name("task")->where(["id"=>$id,"userid"=>$this->userid])->update(["status"=>1]);
                Db::name("process")->where(["id"=>$process["process_id"]])->update([$process["task_type"]=>1]);//修改当前流程的状态
                Db::commit();
            }catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }
            return json(["code"=>200,"msg"=>"任务更改成功"]);
        }
        $process_next = process($process["task_type"]);//返回下一流程的标识
        //var_dump($process_next);
        /*如果下一流程是开板或者描版，则查看是否已经有开板信息和描版信息，如果有的话直接跳过该流程进入下一流程*/
        if($process_next == "openboard" || $process_next == "tracing"){
            $info = Db::name("commodityinfo")->where(["commodityid"=>$process["CommodityId"]])->find();
            if($info["openboard"] && $process_next == "openboard"){
                Db::name("process")->where(["id"=>$process["process_id"]])->update(["openboard"=>1]);
                $process_next = process($process_next,$process["process_id"]);
            }
            if($info["tracing"] && $process_next == "tracing"){
                Db::name("process")->where(["id"=>$process["process_id"]])->update(["tracing"=>1]);
                $process_next = process($process_next,$process["process_id"]);
            }
        }
        if($process_next == false){//没有下一流程则表示流程完结
            Db::startTrans();
            try{
                Db::name("process")->where(["id"=>$process["process_id"]])->update([$process["task_type"]=>1,"start_status"=>2]);//修改当前流程的状态
                Db::name("task")->where(["id"=>$id,"userid"=>$this->userid])->update(["status"=>1]);//修改当前任务状态
                Db::commit();
                return json(["code"=>200,"msg"=>"该流程已经完成"]);
            } catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }

        }
        //当前任务完成后，需要等待；当鞋面和鞋底流程中有一个未完成时，总配料不能进行 只能等待；
        if($process_next == "wait"){
            $re = Db::name("task")->where(["id"=>$id,"userid"=>$this->userid])->update(["status"=>1]);//修改当前任务状态
            Db::name("process")->where(["id"=>$process["process_id"]])->update([$process["task_type"]=>1]);//修改当前流程的状态
            if($re){
                return json(["code"=>200,"msg"=>"任务更改成功"]);
            }else{
                return json(["code"=>500,"msg"=>"任务更改成功失败，任务状态无法更改"]);
            }
        }
        //判断是否为总配料
        if($process_next == "totalmixedIngredients"){
            Db::startTrans();
            try{
                $reul = ProcessService::totalmixedIngredients($process["process_id"],$process["task_type"]);//开始总配料任务
                $re = Db::name("task")->where(["id"=>$id,"userid"=>$this->userid])->update(["status"=>1]);//修改当前任务状态
                Db::name("process")->where(["id"=>$process["process_id"]])->update([$process["task_type"]=>1]);//修改当前流程的状态
                Db::commit();
            }catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }
            return json(["code"=>200,"msg"=>"任务更改成功"]);
        }
        //var_dump($process_next);die;
        $group = group($process_next);//返回下一流程对应的用户组
        $user = users($group);//返回下一流程分配的用户
        if(!$user){
            return json(["code"=>500,"msg"=>"任务流程更新失败，无下一流程人员接手"]);
        }
        /*完成后进入新的流程*/
        Db::startTrans();
        try{
            $location  = $process["task_type"];//流程目前的位置
            $result1 = Db::name("task")->where(["id"=>$id,"userid"=>$this->userid])->update(["status"=>1]);//修改当前任务状态
            $result2 = Db::name("process")->where(["id"=>$process["process_id"]])->update([$process["task_type"]=>1]);//修改当前流程的状态
            if($process_next){
                if(!ProcessService::checktask($process["process_id"],$process_next)){
                    Db::name("task")->insert(["userid"=>$user["user_id"],"process_id"=>$process["process_id"],"task_type"=>$process_next]);
                }
                //ProcessService::startProcess($process["process_id"],$process_next);
                //$result3 = Db::name("task")->insert(["userid"=>$user["user_id"],"process_id"=>$process["process_id"],"task_type"=>$process_next]);//为下一流程用户分配人员
            }
            Db::commit();
        }catch (\ErrorException $e){
            Db::rollback();
            return json(["code"=>500,"msg"=>$e->getMessage()]);
        }
        return json(["code"=>200,"msg"=>"任务更改成功"]);
    }

    /*
     * 任务转接
     * */
    public function taskTransfer(){
        $taskid = $this->request->param("taskid");
        $user = $this->request->param("user");
        $data =  Db::name("task")->alias("a")
            ->field("a.*,b.user_login,b.user_nickname,c.ErpOrderDetailNo")
            ->join("user b","a.userid = b.id","left")
            ->join("process c","a.process_id = c.id","left")
            ->where(["a.id"=>$taskid])
            ->find();
        if($data["status"] == 1){
            echo "<span style='color: red'>修改失败，该任务已经完成</span>";
        }else{
            if($user){
                Db::startTrans();
                try{
                    if(Db::name("handwork")->where(["taskid"=>$taskid,"userid"=>$data["userid"]])->find()){
                        Db::name("handwork")->where(["taskid"=>$taskid,"userid"=>$data["userid"]])->update(["userid"=>$user]);
                    }
                    $re = Db::name("task")->where(["id"=>$taskid])->update(["userid"=>$user]);
                    Db::commit();
                    echo "<span style='color: red'>修改成功</span>";
                    //$this->success('修改成功!',url('Admin/sys/processAlltask', ['processid' =>$data["process_id"] ]));
                }catch (\ErrorException $e){
                    Db::rollback();
                    echo "<span style='color: red'>修改失败</span>";
                    //$this->success('修改失败!请联系管理员',url('Admin/sys/processAlltask', ['processid' =>$data["process_id"] ]));
                }

            }
        }
        $tasktype = $data["task_type"];
        $data["task_type"] = processname($data["task_type"]);
        $this->assign("data",$data);
            //手工信息
            $temp1 = [];
            $hand = Db::name("handwork")->alias("a")
                ->field("a.*,b.user_login,b.user_nickname,c.task_type,f.user_login as accept_user_login,f.user_nickname as accept_user_nickname")
                ->join("user b","a.userid = b.id","left")
                ->join("user f","a.accept_user = f.id","left")
                ->join("task c","a.taskid = c.id","left")
                ->where(["c.id"=>$taskid])
                ->select();
            foreach ($hand as $ke => $va){
                $temp1["$ke"] = $va;
                if($va["task_type"]){
                    $temp1["$ke"]["task_type"] = processname($va["task_type"]);
                }
            }
            $group = group($tasktype);
            $user = Db::name("role_user")
                ->alias("a")
                ->field("a.user_id,b.user_login,b.mobile,b.user_nickname")
                ->join("user b","a.user_id = b.id","left")
                ->where(["a.role_id"=>$group])
                ->select();
            $this->assign('hand', $temp1);
            $this->assign('user', $user);
        return $this->fetch();

    }

    /*
     * 员工扫二维码确认/查看订单
     * */
    public function qrcodeverification(){
        //$ErpOrderDetailNo = $_GET["ErpOrderDetailNo"];
        $array = ["drill","stickingPad","packing"];
        $origin =explode("?",$_SERVER["REQUEST_URI"]);
        $name = explode("/",$origin[0]);
        $ErpOrderDetailNo = end($name);
        $uid = $this->userid;
        if($ErpOrderDetailNo){
            $process = Db::name("process")->where(["ErpOrderDetailNo"=>$ErpOrderDetailNo])->find();
            //echo Db::name("process")->getLastSql();
            //如果是管理人员
            if(Db::name("role_user")->where("user_id=$uid and (role_id=2 or role_id=1)")->find()){
                $this->redirect('/admin/sys/processalltask', ['processid' => $process["id"]]);
            }
            $RE = Db::name("task")->where(["userid"=>$uid,"process_id"=>$process["id"]])->select();
            //echo Db::name("task")->getLastSql();
            if($RE[0]) {
                foreach ($RE as $key => $val) {
                    if($val["status"] == 1){
                        return $this->qrcodeshow("该任务已经完成");
                    }
                    if($val["status"] == 2){
                        return $this->qrcodeshow("该任务已经取消");
                    }
                    if(in_array($val["task_type"],$array)){//这几个任务只需扫码就可以完成的，不需要点第二次
                        /*完成后进入新的流程*/
                        Db::startTrans();
                        try{
                            ProcessService::finishProcess($val["process_id"],$val["task_type"]);
                            ProcessService::finishTask($val["id"]);
                            $next = process($val["task_type"]);
                            ProcessService::startProcess($val["process_id"],$next);
                            Db::commit();
                        }catch (\ErrorException $e){
                            Db::rollback();
                            return $this->qrcodeshow($e->getMessage());
                            //return json(["code"=>500,"msg"=>$e->getMessage()]);
                        }
                        continue;
                    }
                    if ($val["status"] == 0 || $val["status"] == 3) {
                        $this->redirect('/admin/sys/myorder',["ErpOrderDetailNo"=>$ErpOrderDetailNo]);
                        return false;
                    }
                    if($val["status"] == 1){
                        $this->redirect('/admin/sys/orderdetail',['id'=>$ErpOrderDetailNo,'taskid'=>$val['id'],'type'=>'edit']);
                        return false;
                    }
                }
                return $this->qrcodeshow("该任务扫码完成");
                //return json(["code"=>200,"msg"=>"该任务扫码完成！"]);
            }else{
                return $this->qrcodeshow("您还没接到该订单的任何任务！");
            }

            /*foreach ($RE as $key => $val){
                if($val["stauts"] == 0){
                    Db::name("task")->where($val)->update(["status"=>3]);//确认该任务
                }
            }*/
            //echo $uid . " * ".$ErpOrderDetailNo;
        }
    }
    /*
     * 扫码完成的任务显示页面
     * */
    public function qrcodeshow($msg){
        $this->assign('msg', $msg);
        return $this->fetch("qrcodeshow");
    }
    /*
     * 退回上一流程
     * para :
     *      id 任务的id
     *      process ： 流程标识
     * */
    public function backprocess(){
        $id = $this->request->param("id");
        $process = $this->request->param("process");
        if($id && $process){
            $process = Db::name("task")->field("process_id")->where(["id"=>$id])->find();
            Db::startTrans();
            try{
                $result1 = Db::name("task")->where(["id"=>$id,"userid"=>$this->userid])->update(["status"=>2]);//修改当前任务状态
                $result2 = Db::name("process")->where(["id"=>$process["process_id"]])->update([$process=>0]);//修改当前流程的状态
                $result3 = Db::name("task")->where(["process_id"=>$process["process_id"],"task_type"=>$process])->update(["status"=>0]);
                //$next_process = process($location,$process["process_id"]);
                 Db::commit();
            }catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }
            return json(["code"=>200,"msg"=>"任务更改成功"]);
        }else{
            return json(["code"=>500,"msg"=>"任务更改失败请联系管理员"]);
        }
    }
    /*
     * 流程管理
     * */

    public function processAdmin(){
        $keyword = $this->request->param("keyword");
        $Sku = $this->request->param("Sku");
        $pagecount = $this->request->param("pagecount");
        $pagecount = $pagecount ? $pagecount : 10;
        if($keyword || $Sku){
            if($keyword){
                $where["a.ErpOrderDetailNo"] = ['like','%'.$keyword.'%'];
            }
            if($Sku){
                $where["a.Sku"] = ['like','%'.$Sku.'%'];
            }
            $data = Db::name("process")
                ->alias("a")
                ->field("a.*,b.Remark as Urgent")
                ->join("urgentorderdetail b","a.ErpOrderDetailNo=b.ErpOrderDetailNo","left")
                ->where($where)
                ->order("a.id desc")
                ->paginate($pagecount);
        }else{
            $start_status = $this->request->param("start_status") ? $this->request->param("start_status") : 1;
            $data = Db::name("process")->alias("a")->field("a.*,b.Remark as Urgent")->join("urgentorderdetail b","a.ErpOrderDetailNo=b.ErpOrderDetailNo","left")->order("a.id desc")->where("a.start_status =$start_status")->paginate($pagecount);
        }
        //var_dump($data);
        $this->assign('pages', $data);
        return $this->fetch();
    }

    /*
     * 添加流程
     * */
    public function addprocess(){
        header("Content-type: text/html; charset=gbk");
        $file = "";
        if($this->request->isPost()){
            //var_dump($_FILES);
            if ($_FILES["file"]["error"] == 0)
            {

                if (!file_exists("/upload/purchaselist/" . $_FILES["file"]["name"])) {
                    // 如果 upload 目录不存在该文件则将文件上传到 upload 目录下
                    //$_FILES["$key"]["name"] =  iconv('utf-8','gb2312',"upload/".$_FILES["$key"]["name"]);;
                    //var_dump($_FILES["$key"]);die;
                    //$name = iconv('utf-8',"gbk//IGNORE", "upload/purchaselist/" .$_FILES["file"]["name"]);
                    $edn = explode('.', $_FILES["file"]["name"]);
                    $ext = end($edn);
                    $name = "upload/purchaselist/" .date("Ymdhis").'.'.$ext;
                    move_uploaded_file($_FILES["file"]["tmp_name"], $name);
                    $file = "/upload/purchaselist/" . $_FILES["file"]["name"];
                    $realname =$_FILES["file"]["name"];
                    $this->excel($name,$realname);
                    echo "上传成功！";
                }
            }
        }

        $this->assign('name', $file);
        return $this->fetch();
    }
    /*
     * 修改流程状态
     * */

    public function processStatus(){
        $id = $this->request->param("id");
        $start_status = $this->request->param("start_status");
        if($id){
            switch ($start_status){
                case 0:
                    Db::startTrans();
                    try {
                        Db::name("task")->where(["process_id"=>$id])->delete();
                        Db::name("process")->where(["id"=>$id])->update(["start_status"=>$start_status]);
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        return json(["code"=>500,"msg"=>$e->getMessage()]);
                    }
                    return json(["code"=>200,"msg"=>"状态修改成功！"]);break;
                case 3:
                    Db::startTrans();
                    try {
                        Db::name("process")->where(["id"=>$id])->update(["start_status"=>$start_status]);//更改流程状态取消
                        Db::name("task")->where("process_id = $id and (status=0 or status=3)")->update(["status"=>2]);//更改该流程未完成的任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        return json(["code"=>500,"msg"=>$e->getMessage()]);
                    }
                    return json(["code"=>200,"msg"=>"状态修改成功！"]);break;
                case 5:
                    Db::startTrans();
                    try {
                        Db::name("process_stock")->insert(["process_id"=>$id]);
                        Db::name("process")->where(["id"=>$id])->update(["start_status"=>$start_status]);//更改流程状态取消
                        Db::name("task")->where("process_id = $id and (status=0 or status=3)")->update(["status"=>2]);//更改该流程未完成的任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        return json(["code"=>500,"msg"=>$e->getMessage()]);
                    }
                    return json(["code"=>200,"msg"=>"状态修改成功！"]);break;
                default:
                    $re = Db::name("process")->where(["id"=>$id])->update(["start_status"=>$start_status]);
                    return json(["code"=>200,"msg"=>"状态修改成功！"]);break;
                /*case 4:
                    $re = Db::name("process")->where(["id"=>$id])->update(["start_status"=>$start_status]);
                    return json(["code"=>200,"msg"=>"状态修改成功！"]);break;*/
            }
        }else{
            return json(["code"=>500,"msg"=>"参数错误"]);
        }
    }
    /*
     * 编辑产品信息
     * */
    public function locationedit(){
        if($commdityid = $this->request->param("commodityid") && $info = $this->request->param("info") ){
            if($re = Db::name("commodityinfo")->where(["commodityid"=>$commdityid])->find()){
                Db::name("commodityinfo")->where(["id"=>$re["id"]])->update(["info"=>$info]);
            }else{
                Db::name("commodityinfo")->insert(["commdityid"=>$commdityid,"info"=>$info]);
            }
        }else{
            return false;
        }
    }
    /*
     * 上传产品信息
     * para:
     *      commodityid:产品id
     * */

    public function upcommodity($commodityid = null){

        if($this->request->isPost() && $ssst = $this->request->param()){
            header("Content-type: text/html; charset=gbk");
            $data = $this->request->param();
            foreach ($_FILES as $key => $val) {
                if ($_FILES["$key"]["error"] == 0)
                {
                    if (!file_exists("/upload/commodityfile/" . $_FILES["$key"]["name"])) {
                        $name = iconv('utf-8','gbk', $_FILES["$key"]["name"]);
                        move_uploaded_file($_FILES["$key"]["tmp_name"], "upload/commodityfile/" .$name);
                        $data['post']["$key"] = "/upload/commodityfile/" . $_FILES["$key"]["name"];
                    }
                }
            }
            if(Db::name("commodityinfo")->where(["commodityid"=>$data["post"]["commodityid"]])->find()){
                if(Db::name("commodityinfo")->where(["commodityid"=>$data["post"]["commodityid"]])->update($data["post"])){
                    //echo url('Admin/sys/commoditylist', ['id' => $data["post"]["commodityid"]]);die;
                    $this->success('添加成功!',$this->request->param("lasturl"));
                }else{
                    $this->error("添加失败",url('Admin/sys/commoditylist', ['Id' => $data["post"]["commodityid"]]));
                }
            }else{
                if(Db::name("commodityinfo")->insert($data["post"])){
                    $this->success('添加成功!',$this->request->param("lasturl"));
                    //$this->success('添加成功!',url('Admin/sys/commoditylist', ['Id' => $data["post"]["commodityid"]]));
                }else{
                    $this->error("添加失败",url('Admin/sys/commoditylist', ['Id' => $data["post"]["commodityid"]]));
                }
            }
        }else{
            $commodityid = $this->request->param("commodityid");
            $info = Db::name("commodityinfo")->where(["commodityid"=>$commodityid])->find();
            $this->assign('info', $info);
            return $this->fetch();
        }
    }

    /*
     * 产品列表
     * */
    public function commoditylist(){
        if($id = $this->request->param("Id")){
            $where = ["Id"=>$id];
        }
        if($Sku = $this->request->param("Sku")){
            $where = (isset($where) && $where) ?  array_merge($where,["Sku"=>$Sku]) : ["Sku"=>$Sku];
        }
        if($start_time = $this->request->param("start_time")){
            $where = (isset($where) && $where) ?  array_merge($where,["AddTime"=>[">",$start_time]]) : ["AddTime"=>[">",$start_time]];
        }
        if($end_time = $this->request->param("end_time")){
            $where = (isset($where) && $where) ?  array_merge($where,["AddTime"=>["<",$end_time]]) : ["AddTime"=>["<",$end_time]];
        }
        if(isset($where)){
            $list = Db::name("commodity")->where($where)->paginate(10);
        }else{
            $list = Db::name("commodity")->paginate(10);
        }

        $this->assign('list', $list);
        return $this->fetch();
    }

    /*
     *采购单信息显示
     * */
    public function ordershow(){
        $ErpOrderDetailNo = $this->request->param("orderid");
        if($ErpOrderDetailNo){
            $sql = "select a.*,b.Remark,b.ErpOrderDetailNo from PurchaseDetail b left join Commodity a on b.CommodityId = a.Id WHERE b.ErpOrderDetailNo='$ErpOrderDetailNo'";
            $data = sqlServer($sql);
            foreach ($data as $key => $val){
                $te = explode(",",$val["Image"]);
                $data["$key"]["Image"] = $te[0];
            }
            $this->assign('data', $data);

            //var_dump($data);
        }else{
            $this->error("找不到该订单");
        }
        return $this->fetch();
    }

    /*
     *任务查看
     * */

    public function taskshow(){
        $processid= $this->request->param("processid");
        $type = $this->request->param("type");
        if($processid && $type){
            $data = Db::name("task")->alias("a")
                    ->field("a.*,b.user_login,b.user_nickname,c.ErpOrderDetailNo")
                    ->join("user b","a.userid = b.id","left")
                    ->join("process c","a.process_id = c.id","left")
                    ->where(["a.process_id"=>$processid,"task_type"=>$type])
                    ->find();
            if($data){
                $data["task_type"] = processname($data["task_type"]);
            }
            $this->assign('data', $data);

            //var_dump($data);
        }else{
            $this->error("找不到该任务");
        }
        return $this->fetch();
    }
    /*
     * 流程的所有任务
     * */

    public function processAlltask(){
        $processid= $this->request->param("processid");
        if($processid){
            $temp = [];
            $data = Db::name("task")->alias("a")
                ->field("a.*,b.user_login,b.user_nickname,c.ErpOrderDetailNo")
                ->join("user b","a.userid = b.id","left")
                ->join("process c","a.process_id = c.id","left")
                ->where(["a.process_id"=>$processid])
                ->select();

            foreach ($data as $key => $val){
                $temp["$key"] = $val;
                if($val["task_type"]){
                    $temp["$key"]["task_type"] = processname($val["task_type"]);
                }
            }
            //手工信息
            $temp1 = [];
            $hand = Db::name("handwork")->alias("a")
                ->field("a.*,b.user_login,b.user_nickname,c.task_type,f.user_login as accept_user_login,f.user_nickname as accept_user_nickname")
                ->join("user b","a.userid = b.id","left")
                ->join("user f","a.accept_user = f.id","left")
                ->join("task c","a.taskid = c.id","left")
                ->where(["c.process_id"=>$processid])
                ->select();
            foreach ($hand as $ke => $va){
                $temp1["$ke"] = $va;
                if($va["task_type"]){
                    $temp1["$ke"]["task_type"] = processname($va["task_type"]);
                }
            }
            $this->assign('hand', $temp1);
            //var_dump($temp);exit;
            $this->assign('ta', $temp);

            //var_dump($data);
        }else{
            $this->error("找不到该任务");
        }
        return $this->fetch();
    }

    public function excel($filepath,$realname)
    {
        header("Content-type: text/html; charset=utf-8");
        error_reporting(E_ALL);
        date_default_timezone_set('Asia/ShangHai');
        /** PHPExcel_IOFactory */
        $file_temp = dirname(dirname(dirname(__DIR__)));
        //$filename = "2000.xls";
        $file = $file_temp."/public/".$filepath;
        if (!file_exists($file)) {
            exit("not found $filepath.\n");
        }
        $ext_arr= explode(".",$filepath);
        $ext = end($ext_arr);
        if($ext == "xls"){
            $reader = PHPExcel_IOFactory::createReader('Excel5'); //设置以Excel5格式(Excel97-2003工作簿)
        }else if($ext == "xlsx"){
            $reader = new \PHPExcel_Reader_Excel2007();
        }
        //$reader  = new \PHPExcel_Reader_Excel2007();
        $PHPExcel = $reader->load($file); // 载入excel文件
        $sheet = $PHPExcel->getSheet(0); // 读取第一個工作表
        $highestRow = $sheet->getHighestRow(); // 取得总行数
        //echo $highestRow;die;
        $highestColumm = $sheet->getHighestColumn(); // 取得总列数
        //ob_end_clean();//清除缓冲区,避免乱码
        /** 循环读取每个单元格的数据 */

        for ($row = 2; $row <= $highestRow; $row++){//行数是以第1行开始
            $data["Image"] = $sheet->getCell("A".$row)->getValue();
            $data["OrdeInfo"] = $sheet->getCell("B".$row)->getValue();
            $data["Sku"] = $sheet->getCell("C".$row)->getValue();
            $data["count"] = $sheet->getCell("D".$row)->getValue();
            $data["ordernum"] = $sheet->getCell("E".$row)->getValue();
            $data["ErpOrderDetailNo"] = $sheet->getCell("F".$row)->getValue();
            $data["Size"] = $sheet->getCell("G".$row)->getValue();
            $data["Remark"] = $sheet->getCell("H".$row)->getValue();
            $data["CommodityRmark"] = $sheet->getCell("I".$row)->getValue();
            $data["OrderRemark"] = $sheet->getCell("J".$row)->getValue();
            $data["HeelNum"] = $sheet->getCell("K".$row)->getValue();
            $data["AircraftBoard"] = $sheet->getCell("L".$row)->getValue();
            $data["Face"] = $sheet->getCell("M".$row)->getValue();
            $data["ShoeLast"] = $sheet->getCell("N".$row)->getValue();
            $data["Bottom"] = $sheet->getCell("O".$row)->getValue();
            $data["Material"] = $sheet->getCell("P".$row)->getValue();
            $data["WaterTableModel"] = $sheet->getCell("Q".$row)->getValue();
            $data["WoodHeelModel"] = $sheet->getCell("R".$row)->getValue();
            $data["BrandName"] = $sheet->getCell("S".$row)->getValue();
            $data["PurchasePrice"] = $sheet->getCell("T".$row)->getValue();
            $data["Createdate"] = $sheet->getCell("U".$row)->getValue();
            $data["Urgent"] = $sheet->getCell("V".$row)->getValue();
            $data["Manytimes"] = $sheet->getCell("W".$row)->getValue();
            $data["FirstSpu"] = $sheet->getCell("X".$row)->getValue();
            $data["filename"] = $filepath;
            $data["realname"] = $realname;
            //echo "sssss".$data["Sku"];
            //print_r($data["Image"]);
            //echo "<img src='".$data["Image"]."'>";exit;
            if(!Db::name("productionlist")->where(["ErpOrderDetailNo"=>$data["ErpOrderDetailNo"]])->find()){
                $re = Db::name("productionlist")->insert($data);
                if(!$re){
                    echo $data["Sku"]."行无法插入";
                    return false;exit;
                }
            }
        }
    }

    /*
     * 手工列表
     * */
    public function handlist(){
        $handid = $this->request->param("id");
        $user = $this->userid;
        $status = $this->request->param("status");
        if($status){
            //var_dump($status);die;
            $re = Db::name("handwork")->where(["id"=>$handid,"accept_user"=>$user])->update(["status"=>$status]);
            if($re){
                echo "<span style='color:green'>修改成功</span>";
                //$this->success('修改成功!',url('Admin/sys/myorder'));
            }else{
                echo Db::name("handwork")->getLastSql();
                echo "<span style='color:red'>更改状态失败!</span>";
            }
        }
        $where["a.accept_user"] = $user;
        if($handid){
            $where["a.id"] = $handid;
        }
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        if($ErpOrderDetailNo){
            $where["c.ErpOrderDetailNo"] = ["like","%$ErpOrderDetailNo%"];
        }
        $start_time = $this->request->param("start_time");
        $end_time = $this->request->param("end_time");
        if($start_time){
            $where["a.addtime"][] = [">","$start_time"];
            if($end_time){
                $where["a.addtime"][] = ["<","$end_time"];
            }
        }
        $data = Db::name("handwork")
        ->alias("a")
            ->field("a.*,c.Sku,c.ErpOrderDetailNo,b.process_id,b.task_type")
            ->join("task b","a.taskid = b.id","left")
            ->join("process c","b.process_id=c.id","left")
        ->where($where)->paginate(10);
        /*echo $start_time;
        echo Db::name("handwork")->getLastSql();die;*/
        //var_dump($data);exit;
        $temp = [];
        foreach ($data as $k=>$val){
            $temp["$k"] = $val;
            $temp["$k"]["tasktype"]= processname($val["task_type"]);
        }
        $this->assign("data",$temp);
        $this->assign("page",$data);
        return $this->fetch();
    }

    /*
     * 二维码生成
     * */
    public function qrcode(){
        $img = "";
        if($ordernum = $this->request->param("ordernum")){
            $content =
            //$qr = new QRcode("http://47.108.221.146/q/SHD0401029");
            $request = Request::instance();
            $domain = $request->domain();
            $value = $domain."/q/".$ordernum;
            $errorCorrectionLevel = 'L';  //容错级别
            $matrixPointSize = 4;      //生成图片大小
            //生成二维码图片
            // 判断是否有这个文件夹  没有的话就创建一个
            if(!is_dir("qrcode")){
                // 创建文件加
                mkdir("qrcode");
            }
            //设置二维码文件名
            $filename = 'qrcode/'.$ordernum.'.png';
            //生成二维码
            QRcode::png($value,$filename , $errorCorrectionLevel, $matrixPointSize, 2);
            //$qr->level("L"); // L M Q H



            $img =  "<img src='".$domain.'/'.$filename."'>";
        }

        $this->assign('img', $img);
        return $this->fetch();
    }

    /*
     * 批量鞋面审单
     * */
    public function batchExaminePaper(){
        if($post = $this->request->isPost()){
            $post = $_POST["post"];
            foreach ($post as $key => $val){
                $task = ProcessService::getTask($key);
                $next = ProcessService::nextTask($task["task_type"]);
                if($task["is_purchase"] == 0 || $task["is_purchase"] == "2" ){//不需要采购材料
                    Db::startTrans();
                    try{
                        ProcessService::finishProcess($task["process_id"],$task["task_type"]);//完成流程表对应的当前任务
                        ProcessService::finishTask($task["id"]);//完成当前任务表中的对应的任务
                        if(isset($val["openboard"]) && $val["openboard"] == "1"){
                            $next = "openboard";
                            Db::name("process")->where(["id"=>$task["process_id"]])->update(["openboard"=>0]);
                            Db::name("process")->where(["id"=>$task["process_id"]])->update(["tracing"=>0]);
                        }else{
                            Db::name("process")->where(["id"=>$task["process_id"]])->update(["openboard"=>2]);
                            Db::name("process")->where(["id"=>$task["process_id"]])->update(["tracing"=>2]);
                        }
                        ProcessService::startProcess($task["process_id"],$next);//开始流程的下一个任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        $this->error("任务id".$key."提交事务失败！请联系管理员",url("admin/sys/myorder"));
                    }
                }
            }
        }
        return $this->myOrder();
    }

    /*
     * 添加采购
     * */
    public function addpurchase(){
        $purchase_type = $this->request->param("purchase_type");
        $taskid = $this->request->param("taskid");
        if($purchase_type && $taskid ){
            $purchase_add_time = date("Y-m-d H:i:s");
            $re = Db::name("task")->where(["id"=>$taskid])->update(["purchase_type"=>$purchase_type,"is_purchase"=>1,"purchase_add_time"=>$purchase_add_time]);
            if($re){
                return ["code"=>200,"msg"=>"添加采购完成"] ;
            }else{
                return ["code"=>500,"msg"=>"添加采购失败！请联系管理员"] ;
            }
        }else{
            return ["code"=>500,"msg"=>"输入信息不正确"] ;
        }
    }

    /*
     *完成采购
     * */
    public function finishpurchase(){
        $taskid = $this->request->param("taskid");
        if($taskid){
            $purchase_status = $this->request->param("purchase_status");
            $data["is_purchase"] = $purchase_status;
            $data["purchase_finish_time"] = date("Y-m-d H:i:s");
            if($purchase_status == 0){
                $data["purchase_type"] = null;
            }else{
                $purchase_status = $purchase_status ? $purchase_status : 2;
            }
            $data["is_purchase"] = $purchase_status;
            $re = Db::name("task")->where(["id"=>$taskid])->update($data);
            //echo Db::name("task")->getLastSql();die;
            if($re){
                return ["code"=>200,"msg"=>"采购处理完成"] ;
            }else{
                return ["code"=>500,"msg"=>"采购处理失败！请联系管理员"] ;
            }
        }else{
            return ["code"=>500,"msg"=>"输入信息不正确"] ;
        }
    }

    /*
     * 批量鞋底审单
     * */
    public function batchexaminePaperbottom(){
        if($post = $this->request->isPost()){
            $post = $_POST["post"];
            foreach ($post as $key => $val){
                $task = ProcessService::getTask($key);
                $next = ProcessService::nextTask($task["task_type"]);
                if($task["is_purchase"] == 0 || $task["is_purchase"] == "2" ){//不需要采购材料
                    Db::startTrans();
                    try{
                        ProcessService::finishProcess($task["process_id"],$task["task_type"]);//完成流程表对应的当前任务
                        ProcessService::finishTask($task["id"]);//完成当前任务表中的对应的任务
                        if(isset($val["last"]) && $val["last"] == "1"){
                            ProcessService::startProcess($task["process_id"],"last");//开始流程的开楦任务
                            ProcessService::modifyprocess($task["process_id"],"last",0);//流程开楦需要
                        }else{
                            ProcessService::modifyprocess($task["process_id"],"last");//流程开楦不需要
                        }
                        if(isset($val["threeD"]) && $val["threeD"] == "1"){
                            ProcessService::startProcess($task["process_id"],"threeD");//开始流程的3d任务
                            ProcessService::modifyprocess($task["process_id"],"threeD",0);//流程3D需要
                        }else{
                            ProcessService::modifyprocess($task["process_id"],"threeD");//流程3D不需要
                        }
                        ProcessService::startProcess($task["process_id"],"outsole");//开始流程的大底任务
                        ProcessService::startProcess($task["process_id"],"midsole");//开始流程的中底任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        $this->error("任务id".$key."提交事务失败！请联系管理员",url("admin/sys/myorder"));
                    }
                }
            }
        }
        return $this->myOrder();
    }

    /*
     * 批量大底
     * */
    public function batchoutsole(){
        if($post = $this->request->isPost()){
            $post = $_POST["post"];
            //var_dump($post);die;
            foreach ($post as $key => $val){
                $task = ProcessService::getTask($key);
                $next = ProcessService::nextTask($task["task_type"]);
                if($task["is_purchase"] == 0 || $task["is_purchase"] == "2" ){//不需要采购材料
                    Db::startTrans();
                    try{
                        ProcessService::finishProcess($task["process_id"],$task["task_type"]);//完成流程表对应的当前任务
                        ProcessService::finishTask($task["id"]);//完成当前任务表中的对应的任务
                        $reul = ProcessService::totalmixedIngredients($task["process_id"],"outsole");//开始总配料任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        $this->error("任务id".$key."提交事务失败！请联系管理员",url("admin/sys/myorder"));
                    }
                }
            }
        }
        return $this->myOrder();
    }

    /*
     * 批量中底
     * */
    public function batchmidsole(){
        if($post = $this->request->isPost()){
            $post = $_POST["post"];
            //var_dump($post);die;
            foreach ($post as $key => $val){
                $task = ProcessService::getTask($key);
                $next = ProcessService::nextTask($task["task_type"]);
                if($task["is_purchase"] == 0 || $task["is_purchase"] == "2" ){//不需要采购材料
                    Db::startTrans();
                    try{
                        ProcessService::finishProcess($task["process_id"],$task["task_type"]);//完成流程表对应的当前任务
                        ProcessService::finishTask($task["id"]);//完成当前任务表中的对应的任务
                        $reul = ProcessService::totalmixedIngredients($task["process_id"],"midsole");//开始总配料任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        $this->error("任务id".$key."提交事务失败！请联系管理员",url("admin/sys/myorder"));
                    }
                }
            }
        }
        return $this->myOrder();
    }

    /*
     * 批量配辅料
     * */
    public function batchaccessories(){
        if($post = $this->request->isPost()){
            $post = $_POST["post"];
            //var_dump($post);die;
            foreach ($post as $key => $val){
                $task = ProcessService::getTask($key);
                $next = ProcessService::nextTask($task["task_type"]);
                if(Db::name("handwork")->where(["taskid"=>$key,"status"=>0])->find()){//有无未完成的手工，有则跳过
                    continue;
                }
                if($task["is_purchase"] == 0 || $task["is_purchase"] == "2" ){//不需要采购材料
                    Db::startTrans();
                    try{
                        ProcessService::finishProcess($task["process_id"],$task["task_type"]);//完成流程表对应的当前任务
                        ProcessService::finishTask($task["id"]);//完成当前任务表中的对应的任务
                        ProcessService::startProcess($task["process_id"],$next);//下一阶段任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        $this->error("任务id".$key."提交事务失败！请联系管理员",url("admin/sys/myorder"));
                    }
                }
            }
        }
        return $this->myOrder();
    }

    /*
     * 批量总配料
     * */
    public function batchtotalmixedIngredients(){
        if($post = $this->request->isPost()){
            $post = $_POST["post"];
            //var_dump($post);die;
            foreach ($post as $key => $val){
                $task = ProcessService::getTask($key);
                $next = ProcessService::nextTask($task["task_type"]);
                if($task["is_purchase"] == 0 || $task["is_purchase"] == "2" ){//不需要采购材料
                    Db::startTrans();
                    try{
                        ProcessService::finishProcess($task["process_id"],$task["task_type"]);//完成流程表对应的当前任务
                        ProcessService::finishTask($task["id"]);//完成当前任务表中的对应的任务
                        ProcessService::startProcess($task["process_id"],$next);//下一阶段任务
                        Db::commit();
                    }catch (\ErrorException $e){
                        Db::rollback();
                        $this->error("任务id".$key."提交事务失败！请联系管理员",url("admin/sys/myorder"));
                    }
                }
            }
        }
        return $this->myOrder();
    }

    /*
     * 给任务添加备注
     * */
    public function remark(){
        $taskid = $this->request->param("taskid");
        $remark = $this->request->param("remark");
        if($taskid && $remark){
            $re = Db::name("task")->where(["id"=>$taskid])->update(["otherinfo"=>$remark]);
            if($re){
                return ["code"=>200,"msg"=>"备注完成"] ;
            }else{
                return ["code"=>500,"msg"=>"备注失败"] ;
            }
        }else{
            return ["code"=>500,"msg"=>"备注失败,请填写备注"] ;
        }
    }
    /*
     * 任务的申述
     * */
    public function representations(){
        $id = $this->request->param("id");
        if($id){
                $time = date("Y-m-d H:i:s");
                if(!Db::name("representations")->where(["taskid"=>$id,"status"=>0])->find()){
                    $re = Db::name("representations")->insert(["taskid"=>$id,"userid"=>$this->userid,"handletime"=>$time]);
                    if($re){
                        return ["code"=>200,"msg"=>"申述已经添加，等待管理员处理"] ;
                    }else{
                        return ["code"=>500,"msg"=>"申述失败 请正确填写数据"] ;
                    }
                }else{
                    return ["code"=>500,"msg"=>"申述失败 您已经申述了该任务"] ;
                }
        }else{
            return ["code"=>500,"msg"=>"申述失败 未找到任务"] ;
        }
    }

    /*
     * 处理申述的页面
     * */
    public function taskRepresentations(){
       $data = Db::name("representations")
           ->alias("a")
           ->field("a.*,c.ErpOrderDetailNo,d.user_nickname")
           ->join("task b","a.taskid=b.id","left")
           ->join("process c","c.id=b.process_id","left")
           ->join("user d","d.id=a.userid","left")
           ->where(["a.status"=>0])->paginate(10);
       $this->assign("data",$data);
       return $this->fetch();
    }

    public function dorepresentations(){
        $id = $this->request->param("id");
        $status = $this->request->param("status");
        $taskid = $this->request->param("taskid");
        if($id){
            Db::startTrans();
            try{
                Db::name("representations")->where(["id"=>$id])->update(["status"=>1,"result"=>$status,"handleid"=>$this->userid]);//修改当前申述表状态
                if($status == 1){
                    Db::name("task")->where(["id"=>$taskid])->update(["status"=>1]);
                }
                Db::commit();
                return json(["code"=>200,"msg"=>"申述处理成功"]);
            } catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }

        }else{
            return ["code"=>500,"msg"=>"申述失败 未找到任务"] ;
        }
    }

    /*
     * 可能存在库存的订单
     * */
    public function queenList(){
        $queen = StockService::queenStockData();
        $this->assign("data",$queen);
        return $this->fetch();
    }
    /*
     * 库存匹配页面
     * */
    public function queenStockData(){
        $id = $this->request->param("process_id");
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        if($id){
            $data = StockService::getOrderByErpOrderDetailNo($ErpOrderDetailNo);//获取新流程的订单信息
            $source  =$data ? $data[0] : false;
            $sku = $source["Sku"];
            $stocklist = StockService::getSkuOrdeInfo($sku);
            $this->assign("newprocess",$data);
            $this->assign("stockprocess",$stocklist);
            return $this->fetch();
        }
    }
    /*
     * 启用库存
     * */
    public function openStock(){
        $stock = $this->request->param("stock");
        $newprccess = $this->request->param("newprocess");
        if($stock && $newprccess){
            return StockService::openStock($stock,$newprccess);
        }
    }

    /*
     * 不用库存，开始新流程
     * */
    public function newprocess(){
        if($ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo")){
            $process = Db::name("process")->field("id")->where(["ErpOrderDetailNo"=>$ErpOrderDetailNo])->find();
            if(startProcess($process["id"])){
                return json(["code"=>200,"msg"=>"开启流程成功"]);
            }else{
                return json(["code"=>500,"msg"=>"开启流程失败"]);
            }
        }else{
            return json(["code"=>500,"msg"=>"参数错误"]);
        }
    }
    /*
     * 采购员列表
     * */
    public function purchaselist(){
        $where = ["a.userid"=>$this->userid,"a.is_purchase"=>["neq",0]];
        if($taskid = $this->request->param("taskid")){
            $where["a.id"] = $taskid;
        }
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        if($ErpOrderDetailNo){
            $where["b.ErpOrderDetailNo"] = ["like","%$ErpOrderDetailNo%"];
        }
        $start_time = $this->request->param("start_time");
        $end_time = $this->request->param("end_time");
        if($start_time){
            $where["a.purchase_add_time"][] = [">","$start_time"];
            if($end_time){
                $where["a.purchase_add_time"][] = ["<","$end_time"];
            }
        }
        $data =Db::name("task")
            ->alias("a")
            ->field("a.*,b.ErpOrderDetailNo,b.Sku")
            ->join("process b","a.process_id=b.id","left")
            ->where($where)->paginate(50);
        $this->assign("data",$data);
        $type = processname();
        $this->assign("type",$type);
        return $this->fetch();
    }

    /*
     * 修改密码
     * */
    public function passwordmpdify(){
        $userid = $this->userid;
        if ($this->request->isPost()) {
            $original_password = $_POST['original_password'];
            $sure_pass = $_POST['sure_pass'];
            if($sure_pass != $_POST['user_pass']){
                $this->error("修改失败！两次输入密码不一致");
            }
            $pass = cmf_password($original_password);
            unset($_POST['original_password']);
            unset($_POST['sure_pass']);
            $_POST['user_pass'] = cmf_password($_POST['user_pass']);
            $result = DB::name('user')->where(["id"=>$userid,"user_pass"=>$pass])->update($_POST);
            if ($result !== false) {
                $this->success("修改成功！");
            } else {
                $this->error("修改失败！");
            }
        }
        return $this->fetch();
    }
    /*
     * 申请撤回
     * */
    public function recall(){
        $taskid = $this->request->param("taskid");
        $mark = $this->request->param("mark");
        if($taskid){
            $data["userid"]= $this->userid;
            $data["remark"] = $mark;
            $data["taskid"] = $taskid;
            $data["status"] = 0;
            if(!Db::name("recall")->field("id")->where($data)->find()){
                $re = Db::name("recall")->insert($data);
                if($re){
                    return ["code"=>200,"msg"=>"申请完成"] ;
                }else{
                    return ["code"=>500,"msg"=>"申请失败"] ;
                }
            }else{
                return ["code"=>500,"msg"=>"申请失败，你已经申请过了"] ;
            }
        }else{
            return ["code"=>500,"msg"=>"请求信息错误"] ;
        }

    }

    /*
     * 鞋底审单添加通用备注
     * */
    public function productmark(){
        $processid= $this->request->param("processid");
        $product_mark = $this->request->param("product_mark");
        if($processid && $product_mark){
            $re = Db::name("process")->where(["id"=>$processid])->update(["product_mark"=>$product_mark]);
            if($re){
                return ["code"=>200,"msg"=>"success"];
            }else{
                return ["code"=>500,"msg"=>"操作失败，请稍后再试"];
            }
        }else{
            return ["code"=>500,"msg"=>"操作失败，参数错误"];
        }
    }
}