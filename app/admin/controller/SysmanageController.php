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

class SysmanageController extends AdminBaseController{
    private $userid = null;
    private $BlankingSupervisor = ["openboard","tracing","distributionBlanking"]; //下料主管
    private $FaceSupervisor = ["accessories","makeFace"]; //面部主管
    private $WarehouseSupervisor = ["examinePaperbottom","threeD","last","outsole","midsole","totalmixedIngredients"]; //仓库主管
    private $BottomSupervisor = ["makeBottom","drill","stickingPad"]; //底部主管
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->userid = cmf_get_current_admin_id();
    }
    private function  condition($array){
        $str = "";
        foreach ($array as $ke=>$va){
            $str .= $str ? ',"'.$va.'"' : '"'.$va.'"';
        }
        return $str;
    }
    /*
     * 列表显示页
     * */

    private function showlist($SupervisorType){
        $type = $this->request->param("type");
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        $condition = $this->condition($SupervisorType);
        //echo $condition;die;
        if($type){
            $where = "a.task_type in ($condition) and a.status =$type";
            if($ErpOrderDetailNo){
                $where .= " and c.ErpOrderDetailNo like '%$ErpOrderDetailNo%'";
            }
            $data = Db::name("task")->alias("a")
                ->field("a.*,b.user_nickname,b.user_login,b.user_status,c.ErpOrderDetailNo")
                ->join("user b","a.userid = b.id","left")
                ->join("process c","a.process_id = c.id","left")
                ->where($where)
                ->order(" a.id desc,a.userid asc")
                ->paginate(50);
        }else{
            $where = "a.task_type in ($condition) and (a.status =0 or a.status =3)";
            if($ErpOrderDetailNo){
                $where .= " and c.ErpOrderDetailNo like '%$ErpOrderDetailNo%'";
            }
            //echo "sssssss".$where;die;
            $data = Db::name("task")->alias("a")
                ->field("a.*,b.user_nickname,b.user_login,b.user_status,c.ErpOrderDetailNo")
                ->join("user b","a.userid = b.id","left")
                ->join("process c","a.process_id = c.id","left")
                ->where($where)
                ->order(" a.userid asc,a.id desc")
                ->paginate(50);
        }
        //echo  Db::name("task")->getLastSql();die;
        $type = processname();
        $this->assign('type', $type);
        $this->assign('data', $data);

    }
    /*
     *下料主管列表
     * */
    public function BlankingSupervisor(){
         $this->showlist($this->BlankingSupervisor);
        return $this->fetch("blankingsupervisor");
    }
    /*
     *面部主管列表
     * */
    public function FaceSupervisor(){
         $this->showlist($this->FaceSupervisor);
        return $this->fetch("facesupervisor");
    }
    /*
     *仓库主管列表
     * */
    public function WarehouseSupervisor(){
        if($request = $this->request->param("export")){
            ProcessService::exportExcel();
        }
         $this->showlist($this->WarehouseSupervisor);
        return $this->fetch("warehousesupervisor");
    }
    /*
     *底部主管列表
     * */
    public function BottomSupervisor(){
         $this->showlist($this->BottomSupervisor);
        return $this->fetch("bottomsupervisor");
    }
    /*
     * 生产管理
     * */
    public function ProductionSupervisor(){
        $type = $this->request->param("type");
        $ErpOrderDetailNo = $this->request->param("ErpOrderDetailNo");
        if($type){
            $where = "a.status =$type";
            if($ErpOrderDetailNo){
                $where .= " and c.ErpOrderDetailNo like '%$ErpOrderDetailNo%'";
            }
            $data = Db::name("task")->alias("a")
                ->field("a.*,b.user_nickname,b.user_login,b.user_status,c.ErpOrderDetailNo")
                ->join("user b","a.userid = b.id","left")
                ->join("process c","a.process_id = c.id","left")
                ->where($where)
                ->order(" a.id desc,a.userid asc")
                ->paginate(50);
        }else{
            $where = "(a.status =0 or a.status =3)";
            if($ErpOrderDetailNo){
                $where .= " and c.ErpOrderDetailNo like '%$ErpOrderDetailNo%'";
            }
            $data = Db::name("task")->alias("a")
                ->field("a.*,b.user_nickname,b.user_login,b.user_status,c.ErpOrderDetailNo")
                ->join("user b","a.userid = b.id","left")
                ->join("process c","a.process_id = c.id","left")
                ->where($where)
                ->order(" a.userid asc,a.id desc")
                ->paginate(50);
        }
        //echo  Db::name("task")->getLastSql();die;
        $type = processname();
        $this->assign('type', $type);
        $this->assign('data', $data);
        return $this->fetch("productionsupervisor");
    }
    /*
     * 流程列表
     * */
    public function processlist(){
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

        $this->assign('pages', $data);
        return $this->fetch();
    }

    /*
     * 撤回请求
     * */
    public function processTaskBack(){
        $data = Db::name("recall")
            ->alias("a")
            ->field("a.id,a.userid,a.taskid,a.addtime,a.remark,b.process_id,b.task_type,d.ErpOrderDetailNo,d.start_status,c.user_login,c.user_nickname")
            ->join("task b","a.taskid=b.id","left")
            ->join("process d","d.id=b.process_id","left")
            ->join("user c","a.userid=c.id","left")
            ->where(["a.status"=>0])->paginate(10);
        //echo Db::name("recall")->getLastSql();die;
        $process = processname();
        $this->assign('process', $process);
        $this->assign('data', $data);
        return $this->fetch();
    }
    /*
     * 处理撤回请求
     * */
    public function doprocessTaskBack(){
        $status = $this->request->param("status");
        $id = $this->request->param("id");
        $data = Db::name("recall")
            ->alias("a")
            ->field("a.id,a.userid,a.taskid,a.addtime,b.process_id,b.task_type")
            ->join("task b","a.taskid=b.id","left")
            ->where(["a.id"=>$id])->find();
        if($data){
              return ProcessService::processBack($data["process_id"],$data["task_type"],$id,$status);
        }else{
            return json(["code"=>500,"msg"=>"找不到该订单"]);
        }
    }

    /*
     * 任务单价设置
     * */
    public function priceSetting(){
        if($this->request->isPost()){
            $data = $this->request->post();
            $da["content"] = json_encode($data["post"]);
            $re = DB::name("task_price")->where(["id"=>1])->update($da);
            $setting = $data["post"];
        }else{
            $data = DB::name("task_price")->find();
            $setting = json_decode($data["content"],true);
        }
        $gropname = processname();
        $role = group();
        $this->assign('setting', $setting);
        $this->assign('gropname', $gropname);
        return $this->fetch();
    }

    /*
     * 薪资计算
     * */
    public function salaryCalculation(){
        ProcessService::test();die;
        ProcessService::exportpurchase("2020-06-01 00:35","2020-06-18 23:35");die;
        $start_time = $this->request->param("start_time");
        $end_time = $this->request->param("end_time");
        $export = $this->request->param("export");
        if($export){
            $m = date('Y-m-d', mktime(0,0,0,date('m')-1,1,date('Y')));
            $t = date('t',strtotime($m)); //上个月共多少天
            $start_time = date('Y-m-d', mktime(0,0,0,date('m')-1,1,date('Y'))); //上个月的开始日期
            $start_time .= " 00:00:00";
            $end_time = date('Y-m-d', mktime(0,0,0,date('m')-1,$t,date('Y'))); //上个月的结束日期
            $end_time .= " 23:59:59";
        }
        if($start_time && $end_time){
            ProcessService::exportsalary($start_time,$end_time);
        }
        return $this->fetch();
    }

    /*
     * 请假人员的任务
     * */
    public function leaveTask(){
        $data = Db::name("task")
            ->alias("a")
            ->field("b.user_login,b.user_nickname,a.*,c.ErpOrderDetailNo")
            ->join("user b","a.userid=b.id","left")
            ->join("process c","a.process_id=c.id","left")
            ->where("b.user_status=3 and (a.status=0 or a.status=3)")
            ->paginate(10);
        $this->assign('page', $data);
        return $this->fetch();
    }
}