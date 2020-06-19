<?php

namespace app\admin\command;

use think\cache\driver\Redis;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;
use \api\home\controller\ActivityController as apimodel;
use think\Config;
use app\admin\model\CommodityModel;

class SynDeliver extends Command
{
    protected function configure()
    {
        $this->setName('SynDeliver')->setDescription("同步发货的信息");
    }
    protected function execute(Input $input, Output $output){
        $list = Db::name("process")->where(["start_status"=>1,"deliver"=>0,"packing"=>1])->limit(0,100)->order("id asc")->select();
        //var_dump($list);
        foreach ($list as $key => $val){
            $sql = "select Id from PurchaseDetail where ErpOrderDetailNo='".$val["ErpOrderDetailNo"]."' and (Status='1' or Status='3')";
            $re = sqlServer($sql);
            if($re){
                Db::startTrans();
                try{
                    Db::name("process")->where(["id"=>$val["id"]])->update(["deliver"=>1,"start_status"=>2]);
                    Db::name("task")->where(["process_id"=>$val["id"],"task_type"=>"deliver"])->update(["status"=>1]);
                    Db::commit();
                } catch (\ErrorException $e){
                    Db::rollback();
                }
            }
        }
    }


}

