<?php

namespace app\admin\command;

use app\admin\model\PurchaseListModel;
use think\cache\driver\Redis;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;
use \api\home\controller\ActivityController as apimodel;
use think\Config;

class SynDeliverProcess extends Command
{
    /*
    * 此任务是将process流程表中的流程开始，并将流程分配各对应人员
    * */
    protected function configure()
    {
        $this->setName('SynDeliverProcess')->setDescription("同步发货流程");
    }
    protected function execute(Input $input, Output $output){
        $list = Db::name("process")->where(["start_status"=>1,"deliver"=>0,"packing"=>1])->limit(0,100)->order("id asc")->select();
        var_dump($list);
        foreach ($list as $key => $val){
            $sql = "select Id from PurchaseDetail where ErpOrderDetailNo='".$val["ErpOrderDetailNo"]."' and (Status='1' or Status='3')";
            $re = sqlServer($sql);
            echo $val["ErpOrderDetailNo"];
            var_dump($re);
            continue;
            if($re){
                //echo $val["ErpOrderDetailNo"];
                //var_dump($re);
                // echo "11111";die;
                Db::name("process")->where(["id"=>$val["id"]])->update(["deliver"=>1,"start_status"=>2]);
            }
        }
    }


}

