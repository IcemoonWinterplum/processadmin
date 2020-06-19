<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\admin\service;

use think\cache\driver\Memcache;
use think\Db;

class ProcessService{
    /**
     * 获取对应流程的人员id
     *  para:
     *      string : processname：流程标识 (ep:threeD)
     * */
    public static function getuserid($processname){
        $group = group($processname);//对应流程的组
        $user = users($group);//对应组的成员
        return $user ? $user["user_id"] : false;
    }

    /**
     * 鞋底审单
     */
    public static function examinePaperbottom(){

    }

    /**
     * 开始某一个流程模块/即添加该流程某一模块任务
     *      para:
     *          $processid :流程id
     *          $tasksname:流程名/标识符（ep:threeD）
     */

    public static function startProcess($processid,$tasksname){
        $userid = self::getuserid($tasksname);
        if($userid){
            $con = Db::name("task")->where(["process_id"=>$processid,"task_type"=>$tasksname])->find();
            if(!$con){
                $result3 = Db::name("task")->insert(["userid"=>$userid,"process_id"=>$processid,"task_type"=>$tasksname]);
                if($result3){
                    return ["status"=>true,"msg"=>""] ;
                }else{
                    return ["status"=>false,"msg"=>"无法增加新任务，请联系管理员"] ;
                }
            }else{
                return ["status"=>true,"msg"=>"已经存在相同任务"] ;
            }
        }else{
            return ["status"=>false,"msg"=>"该任务暂无人员接手"] ;
        }
    }

    /**
     * 完成某一个流程模块/即添加该流程某一模块任务
     *      para:
     *          processid :流程id
     *          taskname:流程名/标识符（ep:threeD）
     */

    public static function finishProcess($processid,$taskname,$userid = null){
        $userid = $userid ? $userid : cmf_get_current_admin_id();
        if($userid){
            $result3 = Db::name("process")->where(["id"=>$processid])->update(["$taskname"=>1]);
            if($result3){
                return true;
            }else{
                return false;
            }
        }else{
            return false ;
        }
    }

    /**
     *完成某一个任务
     * */
    public static function finishTask($taskid,$userid = null){
        $userid = $userid ? $userid : cmf_get_current_admin_id();
        if($userid){
            $result3 = Db::name("task")->where(["id"=>$taskid,"userid"=>$userid])->update(["status"=>1]);
            if($result3){
                return true;
            }else{
                return false;
            }
        }else{
            return false ;
        }
    }
    /**
     * 返回流程id
     *      para:
     *          $taskid :任务id
     *      return:
     *          int 流程id
     */

    public static function getProcessId($taskid,$userid = null){
        $userid = $userid ? $userid : cmf_get_current_admin_id();
        if($userid){
            $result3 = Db::name("task")->field("process_id")->where(["id"=>$taskid,"userid"=>$userid])->find();
            if($result3){
                return $result3["process_id"];
            }else{
                return false;
            }
        }else{
            return false ;
        }
    }

    /**
     * 获取task任务
     *  para:
     *      int $taskid : 任务的id
     * */
    public static function getTask($taskid){
        $result = Db::name("task")->where(["id"=>$taskid])->find();
        if($result){
            $result["taskname"] = processname($result["task_type"]);
        }
        return $result ?  $result : false;
    }
    /**
     * 返回下一流程的标识符
     *   para:
     *      $current_task: 当前任务类型
     *  return
     *      string
     * */

    public static function nextTask($current_task){
        return process($current_task);
    }
    /**
     * 3D
     *      para:
     *          processid :流程id
     */
    public static function threeD($processid){
        $userid = self::getuserid("threeD");
        if($userid){
            if(!self::checktask($processid,"threeD")){
                $result3 = Db::name("task")->insert(["userid"=>$userid,"process_id"=>$processid,"task_type"=>"threeD"]);
                if($result3){
                    return ["status"=>true,"msg"=>""] ;
                }else{
                    return ["status"=>false,"msg"=>"无法增加新任务，请联系管理员"] ;
                }
            }else{
                return ["status"=>true,"msg"=>"流程任务已经存在"] ;
            }

        }else{
            return ["status"=>false,"msg"=>"该任务暂无人员接手"] ;
        }
    }
    /**
     * 开楦
     *      para:
     *          processid :流程id
     */
    public static function last($processid){
        $userid = self::getuserid("last");
        if($userid){
            if(!self::checktask($processid,"last")){
                $result3 = Db::name("task")->insert(["userid"=>$userid,"process_id"=>$processid,"task_type"=>"last"]);
                if($result3){
                    return ["status"=>true,"msg"=>""] ;
                }else{
                    return ["status"=>false,"msg"=>"无法增加新任务，请联系管理员"] ;
                }
            }else{
                return ["status"=>true,"msg"=>"流程任务已经存在"] ;
            }
        }else{
            return ["status"=>false,"msg"=>"该任务暂无人员接手"] ;
        }
    }

    /**
     * 总配料
     * para:
     *      int $processid :流程id
     *      string $current_process:当前流程
     * */
    public static function totalmixedIngredients($processid,$current_process){
        $process = Db::name("process")->where(["id"=>$processid])->find();
        if($process){
            if($process["makeFace"] != 1 && $current_process != "makeFace"){
                return ["status"=>false,"msg"=>"开始失败，做面未完成"] ;
            }
            if(($process["threeD"] == 0 || $process["threeD"] == 3)  && $current_process != "threeD"){
                return ["status"=>false,"msg"=>"开始失败，3D未完成"] ;
            }
            if(($process["last"] == 0 || $process["last"] == 3)  && $current_process != "last"){
                return ["status"=>false,"msg"=>"开始失败，开楦未完成"] ;
            }
            if($process["outsole"] != 1 && $current_process != "outsole"){
                return ["status"=>false,"msg"=>"开始失败，大底未完成"] ;
            }
            if($process["midsole"] != 1 && $current_process != "midsole"){
                return ["status"=>false,"msg"=>"开始失败，中底未完成"] ;
            }
            $userid = self::getuserid("totalmixedIngredients");
            if($userid){
                if(!self::checktask($processid,"totalmixedIngredients")){
                    $result3 = Db::name("task")->insert(["userid"=>$userid,"process_id"=>$processid,"task_type"=>"totalmixedIngredients"]);
                    if($result3){
                        return ["status"=>true,"msg"=>""] ;
                    }else{
                        return ["status"=>false,"msg"=>"无法增加新任务，请联系管理员"] ;
                    }
                }else{
                    return ["status"=>true,"msg"=>"改流程任务已经存在"] ;
                }
            }else{
                return ["status"=>false,"msg"=>"该任务暂无人员接手"] ;
            }
        }else{
            return ["status"=>false,"msg"=>"找不到该流程"] ;
        }
    }

    /**
     * 判断某个流程的某个任务模块是否存在
     * para:
     *      int : $processid =>流程id
     *      string:$processname=>流程的任务模块名
     * return true(存在)/false(不存在);
     * */

    public static function checktask($processid,$processname){
        $re  = DB::name("task")->where(["process_id"=>$processid,"task_type"=>$processname])->count();
        if($re){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 更改某流程表某个流程的状态
     * para:
     *      int $processid ：流程id
     *      string $processname:流程的标识符（ep：openboard）
     *      int $stauts :流程状态
     * */
    public static function modifyprocess($processid,$processname,$status = 2){
        $re  = DB::name("process")->where(["id"=>$processid])->update(["$processname"=>$status]);
        if($re){
            return true;
        }else{
            return false;
        }
    }

    /**
     *配料流程完成方法
     *      $processid :流程id
     *      $taskid:任务id
     *      $mixedIngredients：下料类型 1：机器下料；2：下料
     * */

    public static function finishDistributionBlanking($processid,$taskid,$mixedIngredients = null){
        //机器下料23  手工下料24
        if(Db::name("handwork")->where(["taskid"=>$taskid,"status"=>0])->find()){
            return ["status"=>500,"msg"=>"该任务有手工没有完成！"];
        }else{
            //$group = ($mixedIngredients==1) ? 23 : 24;
            $next = process("distributionBlanking");
            $group = group($next);
            $user = users($group);//对应组的成员
            if(!$user){
                return ["status"=>500,"msg"=>"辅料人员不存在"];
            }
            Db::startTrans();
            try{
                Db::name("process")->where(["id"=>$processid])->update(["distributionBlanking"=>1]);//修改当前流程的状态
                Db::name("task")->where(["id"=>$taskid])->update(["status"=>1]);//修改当前任务状态
                if(!self::checktask($processid,$next)){
                    Db::name("task")->insert(["userid"=>$user["user_id"],"process_id"=>$processid,"task_type"=>$next]);//添加下一任务
                }
                Db::commit();
                return json(["code"=>200,"msg"=>"下一任务人员".$user["user_nickname"].'-'.$user["user_nickname"]]);
            } catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }
        }
    }

    /**
     * 配辅料
     *      $processid :流程id
     *      $taskid:任务id
     * */
    public static function finishaccessories($processid,$taskid){
        if(Db::name("handwork")->where(["taskid"=>$taskid,"status"=>0])->find()){
            return ["status"=>500,"msg"=>"该任务有手工没有完成！"];
        }else{
            $next = process("accessories");
            $group = group($next);
            $user = users($group);//对应组的成员
            if(!$user){
                return ["status"=>500,"msg"=>"下一流程人员不存在"];
            }
            Db::startTrans();
            try{
                Db::name("process")->where(["id"=>$processid])->update(["accessories"=>1]);//修改当前流程的状态
                Db::name("task")->where(["id"=>$taskid])->update(["status"=>1]);//修改当前任务状态
                if(!self::checktask($processid,$next)){
                    Db::name("task")->insert(["userid"=>$user["user_id"],"process_id"=>$processid,"task_type"=>$next]);//添加下一任务
                }
                Db::commit();
                $msg = "下一任务人员:".$user["user_nickname"].'-'.$user["user_login"];
                return json(["code"=>200,"msg"=>$msg]);
            } catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }
        }
    }

    /**
     * 导出仓库管理的任务列表
     * */
    public static function exportExcel(){
        $array = ["examinePaperbottom","threeD","last","outsole","midsole","totalmixedIngredients"]; //仓库主管
        $objPHPExcel = new \PHPExcel();
        //4.激活当前的sheet表
        $objPHPExcel->setActiveSheetIndex(0);
        //5.设置表格头（即excel表格的第一行）
        $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', '任务ID')
            ->setCellValue('B1', '流程号')
            ->setCellValue('C1', '内部订单')
            ->setCellValue('D1', '人员账户')
            ->setCellValue('E1', '人员信息')
            ->setCellValue('F1', '添加时间')
            ->setCellValue('G1', '确认时间')
            ->setCellValue('H1', '类型')
            ->setCellValue('I1', '用户状态')
            ->setCellValue('J1', '状态')
            ->setCellValue('K1', '采购')
            ->setCellValue('L1', '采购类型')
            ->setCellValue('M1', '异常信息')
            ->setCellValue('N1', '任务时长');
        //设置A列水平居中
        $objPHPExcel->setActiveSheetIndex(0)->getStyle('A1')->getAlignment()
            ->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        //设置单元格宽度
        //6.循环刚取出来的数组，将数据逐一添加到excel表格。
        $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(10);
        $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('C')->setWidth(20);
        $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('E')->setWidth(20);
        $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('F')->setWidth(30);
        $condition = "";
        foreach ($array as $ke=>$va){
            $condition .= $condition ? ',"'.$va.'"' : '"'.$va.'"';
        }
        $where = "a.task_type in ($condition) and (a.status =0 or a.status =3)";
        $list = $data = Db::name("task")->alias("a")
            ->field("a.*,b.user_nickname,b.user_login,b.user_status,c.ErpOrderDetailNo")
            ->join("user b","a.userid = b.id","left")
            ->join("process c","a.process_id = c.id","left")
            ->where($where)
            ->order(" a.userid asc,a.id desc")
            ->select();
        //var_dump($list);die;
        for($i=0;$i<count($list);$i++){
            $objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),$list[$i]['id']);//ID
            $objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),$list[$i]['process_id']);//标签码
            $objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),$list[$i]['ErpOrderDetailNo']);//防伪码
            $objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2),$list[$i]['user_login']);//ID
            $objPHPExcel->getActiveSheet()->setCellValue('E'.($i+2),$list[$i]['user_nickname']);//标签码
            $objPHPExcel->getActiveSheet()->setCellValue('F'.($i+2),$list[$i]['addtime']);//ID
            $objPHPExcel->getActiveSheet()->setCellValue('G'.($i+2),$list[$i]['confirm_time']);//标签码
            $objPHPExcel->getActiveSheet()->setCellValue('H'.($i+2),processname($list[$i]['task_type']));//
            switch ($list[$i]['user_status']){
                case 0:
                    $user_status = "禁用";break;
                case 1:
                    $user_status = "正常";break;
                case 2:
                    $user_status = "未验证";break;
                case 3:
                    $user_status = "请假";break;
            }
            $objPHPExcel->getActiveSheet()->setCellValue('I'.($i+2),$user_status);//用户状态
            switch ($list[$i]['status']){
                case 0:
                    $status = "未处理";break;
                case 1:
                    $status = "完成";break;
                case 2:
                    $status = "订单撤销";break;
                case 3:
                    $status = "确认";break;
            }
            $objPHPExcel->getActiveSheet()->setCellValue('J'.($i+2),$status);//
            switch ($list[$i]['is_purchase']){
                case 0:
                    $is_purchase = "无采购";break;
                case 1:
                    $is_purchase = "需采购";break;
                case 2:
                    $is_purchase = "完成采购";break;
                case 3:
                    $is_purchase = "采购失败";break;
            }
            $objPHPExcel->getActiveSheet()->setCellValue('K'.($i+2),$is_purchase);//防伪码
            $objPHPExcel->getActiveSheet()->setCellValue('L'.($i+2),$list[$i]['purchase_type']);//防伪码
            $objPHPExcel->getActiveSheet()->setCellValue('M'.($i+2),$list[$i]['otherinfo']);//防伪码
            if(($tem = BetweenTwoDays($list[$i]['addtime'])) > 36){
                $objPHPExcel->getActiveSheet()->getStyle('N'.($i+2))->getFont()->setBold(true)
                    ->setName('Verdana')
                    ->setSize(10)
                    ->getColor()->setRGB('f70808');
            }
            $objPHPExcel->getActiveSheet()->setCellValue('N'.($i+2),$tem);//防伪码
        }
        //7.设置保存的Excel表格名称
        $filename = '人员任务名单'.date('ymd',time()).'.xls';
        //8.设置当前激活的sheet表格名称；
        $objPHPExcel->getActiveSheet()->setTitle('人员名单');
        //9.设置浏览器窗口下载表格
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:inline;filename="'.$filename.'"');
        //生成excel文件
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        //下载文件在浏览器窗口
        $objWriter->save('php://output');
        exit;
    }

    /**
     *  para:
     *      int $processid :流程id
     *      string $task_type:任务类型
     * */
    public static function processBack($processid,$task_type,$recallid=null,$recallstatus = 1){
        $next = process($task_type);
        Db::startTrans();
        try{
            if($recallstatus == 1){
                $re3 = Db::name("recall")->where(["id"=>$recallid])->update(["status"=>$recallstatus]);
                $re1 = Db::name("process")->where(["id"=>$processid])->update(["$task_type"=>0]);
                $re2 = Db::name("task")->where(["process_id"=>$processid,"task_type"=>$task_type])->update(["status"=>0]);
            }else{
                $re3 = Db::name("recall")->where(["id"=>$recallid])->update(["status"=>$recallstatus]);
            }
            Db::commit();
            return json(["code"=>200,"msg"=>"处理完成"]);
        } catch (\ErrorException $e){
            Db::rollback();
            return json(["code"=>500,"msg"=>$e->getMessage()]);
        }
    }

    /**
     * 计算员工薪资
     * */
    public static function exportsalary($start_time,$end_time){
        $data = Db::name("task_price")->find();
        $con = json_decode($data["content"],true);
        $user_group = [];
        foreach ($con as $key =>$val){
            if($val){
                $user_group[] = group($key);//列出需要计算工资的组
            }
        }
        $where = join(',',$user_group);
        $users = Db::name("user")
            ->alias("a")
            ->field("a.user_login,a.user_nickname,b.role_id,b.user_id")
            ->join("role_user b","a.id=b.user_id","left")
            ->where("b.role_id in ($where) and a.user_status=1")
            ->select();
        $objPHPExcel = new \PHPExcel();
        //4.激活当前的sheet表
        $objPHPExcel->setActiveSheetIndex(0);
        //5.设置表格头（即excel表格的第一行）
        $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', '员工信息')
            ->setCellValue('B1', '员工电话')
            ->setCellValue('C1', '开始时间')
            ->setCellValue('D1', '结束时间')
            ->setCellValue('E1', '任务数量')
            ->setCellValue('F1', '任务单价')
            ->setCellValue('G1', '总薪资')
            ->setCellValue('H1', '任务类型');
        $i=0;
        $grop = group();
        foreach ($users as $ke => $va){
            $task_type = array_keys($grop,$va["role_id"]);
            $list = Db::name("task")->where("userid='".$va['user_id']."' and task_type='".$task_type[0]."' and finish_time > '$start_time' and finish_time < '$end_time'")->count();
            $objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),$va["user_nickname"]);//
            $objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),$va["user_login"]);//
            $objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),$start_time);//
            $objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2),$end_time);//
            $objPHPExcel->getActiveSheet()->setCellValue('E'.($i+2),$list);//
            $type = $task_type[0];
            //var_dump($list);die;
            $objPHPExcel->getActiveSheet()->setCellValue('F'.($i+2),$con["$type"]);//
            $total = $list * $con[$task_type[0]];
            $objPHPExcel->getActiveSheet()->setCellValue('G'.($i+2),$total);//
            $name = processname($type);
            $objPHPExcel->getActiveSheet()->setCellValue('H'.($i+2),$name);//
            $i++;
        }
        //7.设置保存的Excel表格名称
        $filename = '人员薪资'.date('ymd',time()).'.xls';
        //8.设置当前激活的sheet表格名称；
        $objPHPExcel->getActiveSheet()->setTitle('人员名单');
        //9.设置浏览器窗口下载表格
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:inline;filename="'.$filename.'"');
        //生成excel文件
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        //下载文件在浏览器窗口
        $objWriter->save('php://output');
        exit;
    }

    /**
     * 导出采购单
     *      $start_time
     *      $end_time
     * */
    public static function exportpurchase($start_time,$end_time){
        $objPHPExcel = new \PHPExcel();
        //4.激活当前的sheet表
        $objPHPExcel->setActiveSheetIndex(0);
        //5.设置表格头（即excel表格的第一行）
        $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', '图片')
            ->setCellValue('B1', '订单信息')
            ->setCellValue('C1', '产品SKU')
            ->setCellValue('D1', '数量')
            ->setCellValue('E1', '内部订单')
            ->setCellValue('F1', '尺码')
            ->setCellValue('G1', '生产备注')
            ->setCellValue('H1', '产品备注')
            ->setCellValue('I1', '订单备注')
            ->setCellValue('J1', '跟高/跟号')
            ->setCellValue('K1', '飞机板')
            ->setCellValue('L1', '面板')
            ->setCellValue('M1', '楦型')
            ->setCellValue('N1', '大底型号和颜色')
            ->setCellValue('O1', '材质')
            ->setCellValue('P1', '水台型号')
            ->setCellValue('Q1', '木根型号')
            ->setCellValue('R1', '品牌')
            ->setCellValue('S1', '任务码');
        $i=0;
        $sql = "SELECT a.Remark,a.ErpOrderDetailNo,
                b.Other,b.Sku,b.Weight,b.Size,b.HeelNum,b.AircraftBoard,b.Face,b.ShoeLast,b.Bottom,b.Color,b.WaterTableModel,b.WoodHeelModel,b.BrandId,b.Image,
                c.ProduceRemark
                  FROM PurchaseDetail a
                  left join Commodity b on a.CommodityId = b.Id
                  LEFT JOIN OrderDetail c on a.OrderDetailId=c.Id
                  where a.AddTime >'2020-06-01 00:35' and a.AddTime <'2020-06-11 23:35' order by a.AddTime asc";
        $data = sqlServer($sql);
        /*var_dump($data);
        die;*/
        //$ss =new Memcache();
        foreach ($data as $ke => $va){
            //$temp  = explode(',',$va["Image"]);
            //$img = $temp[0];
            //$im =  sqlServer("select AliyunPath from OSSFileRelation where SourcePath='$img'");
            //$img = $im[0]["AliyunPath"];

           /* $ch = curl_init();
            $fp=fopen('./girl.jpg', 'w');
            curl_setopt($ch, CURLOPT_URL, "$img");
            curl_setopt($ch, CURLOPT_FAILONERROR, true);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 100);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_FILE, $fp);
            $output = curl_exec($ch);
            $info = curl_getinfo($ch);
            $error = curl_error($ch);
            fclose($fp);*/

            $objDrawing = new \PHPExcel_Worksheet_Drawing();
            /*设置图片路径*/
            $objDrawing->setPath("./girl.jpg");
            /*设置图片高度*/
            $objDrawing->setHeight(100);
            /*设置图片要插入的单元格*/
            $objDrawing->setCoordinates('A'.($i+2));
            /*设置图片所在单元格的格式*/
            $objDrawing->setOffsetX(80);
            $objDrawing->setRotation(20);
            $objDrawing->getShadow()->setVisible(true);
            $objDrawing->getShadow()->setDirection(50);
            $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
/*
            $objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),$va["user_nickname"]);//
            $objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),$va["user_login"]);//
            $objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),$start_time);//
            $objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2),$end_time);//
            $objPHPExcel->getActiveSheet()->setCellValue('E'.($i+2),$list);//
            $type = $task_type[0];
            //var_dump($list);die;
            $objPHPExcel->getActiveSheet()->setCellValue('F'.($i+2),$con["$type"]);//
            $total = $list * $con[$task_type[0]];
            $objPHPExcel->getActiveSheet()->setCellValue('G'.($i+2),$total);//
            $name = processname($type);
            $objPHPExcel->getActiveSheet()->setCellValue('H'.($i+2),$name);//*/
            $i++;
        }
        $write = new \PHPExcel_Writer_Excel5($objPHPExcel);
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");;
        header('Content-Disposition:attachment;filename="测试文件.xls"');
        header("Content-Transfer-Encoding:binary");
        $write->save('php://output');
        exit;
        //7.设置保存的Excel表格名称
       /* $filename = '人员薪资'.date('ymd',time()).'.xls';
        //8.设置当前激活的sheet表格名称；
        $objPHPExcel->getActiveSheet()->setTitle('人员名单');
        //9.设置浏览器窗口下载表格
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:inline;filename="'.$filename.'"');
        //生成excel文件
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        //下载文件在浏览器窗口
        $objWriter->save('php://output');*/
        exit;
    }

    public static function test(){
        $excel = new \PHPExcel();
        //$objDrawing = new \PHPExcel_Worksheet_Drawing();

        /*设置文本对齐方式*/
        $excel->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $excel->getDefaultStyle()->getAlignment()->setVertical(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objActSheet = $excel->getActiveSheet();
        $objActSheet->setCellValue('A1', '图片')
            ->setCellValue('B1', '订单信息')
            ->setCellValue('C1', '产品SKU')
            ->setCellValue('D1', '数量')
            ->setCellValue('E1', '内部订单')
            ->setCellValue('F1', '尺码')
            ->setCellValue('G1', '生产备注')
            ->setCellValue('H1', '产品备注')
            ->setCellValue('I1', '订单备注')
            ->setCellValue('J1', '跟高/跟号')
            ->setCellValue('K1', '飞机板')
            ->setCellValue('L1', '面板')
            ->setCellValue('M1', '楦型')
            ->setCellValue('N1', '大底型号和颜色')
            ->setCellValue('O1', '材质')
            ->setCellValue('P1', '水台型号')
            ->setCellValue('Q1', '木根型号')
            ->setCellValue('R1', '品牌')
            ->setCellValue('S1', '任务码');
        $letter = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N');
        /*设置表头数据*/
        $tableheader = array('姓名', '性别', '年龄', '班级', '头像');
        /*填充表格表头*/
        /*for($i = 0;$i < count($tableheader);$i++) {
            $excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableheader[$i]");
        }*/

        /*设置表格数据*/
        $data = array(
            array('小王', '男', '20', 'CS12', './girl.jpg'),
            array('小李', '女', '21', 'CS12', './girl.jpg'),
            array('小周', '男', '22', 'CS12', './girl.jpg'),
            array('小赵', '女', '23', 'CS12', './girl.jpg'),
            array('小张', '男', '24', 'CS12', './girl.jpg')
        );

        /*填充表格内容*/

           $i=0;
            /*设置表格宽度*/
            $objActSheet->getColumnDimension("$letter[$i]")->setWidth(20);
            /*设置表格高度*/
            $excel->getActiveSheet()->getRowDimension($j)->setRowHeight(100);
            /*向每行单元格插入数据*/
            $sql = "SELECT a.Remark,a.ErpOrderDetailNo,
                b.Other,b.Sku,b.Weight,b.Size,b.HeelNum,b.AircraftBoard,b.Face,b.ShoeLast,b.Bottom,b.Color,b.WaterTableModel,b.WoodHeelModel,b.BrandId,b.Image,
                c.ProduceRemark
                  FROM PurchaseDetail a
                  left join Commodity b on a.CommodityId = b.Id
                  LEFT JOIN OrderDetail c on a.OrderDetailId=c.Id
                  where a.AddTime >'2020-06-01 00:35' and a.AddTime <'2020-06-11 23:35' order by a.AddTime asc";
            $data = sqlServer($sql);
            foreach ($data as $ke => $va){
                    /*实例化插入图片类*/
                    $objDrawing = new \PHPExcel_Worksheet_Drawing();
                    /*设置图片路径*/
                    $objDrawing->setPath('./girl.jpg');
                    /*设置图片高度*/
                    $objDrawing->setHeight(100);
                    /*设置图片要插入的单元格*/
                    $objDrawing->setCoordinates('A'.($i+2));
                    /*设置图片所在单元格的格式*/
                    $objDrawing->setOffsetX(80);
                    $objDrawing->setRotation(20);
                    $objDrawing->getShadow()->setVisible(true);
                    $objDrawing->getShadow()->setDirection(50);
                    $objDrawing->setWorksheet($excel->getActiveSheet());
                    //$excel->getActiveSheet()->setCellValue("$letter[$row]$j","111");
                    $i++;
                }




        $write = new \PHPExcel_Writer_Excel5($excel);
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");;
        header('Content-Disposition:attachment;filename="测试文件.xls"');
        header("Content-Transfer-Encoding:binary");
        $write->save('php://output');
    }
}