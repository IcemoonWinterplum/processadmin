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

class test extends Command
{
    /*
     * 此任务是将purchasedetail表中的采购单添加到process流程表中
     * 采购单条件
     *      IsDelete = 0 =》未被删除
     *      Status   = 0 =》未发货
     * */
    protected function configure()
    {
        $this->setName('test')->setDescription("这是测试任务");
    }

    protected function execute(Input $input, Output $output){
       echo "this is test";
    }
    /*protected function execute(Input $input, Output $output){
        $file = dirname(dirname(dirname(__DIR__)));
        $start = 0;
        if(file_exists($file."/cron/addprocess.txt")){
            $start = file_get_contents($file."/cron/addprocess.txt");
        }
        if($start){
            $list = Db::name("purchasedetail")->where(["IsDelete"=>0,"Status"=>0,"Id"=>[">",$start]])->order("Id asc")->limit(0,"10")->select();
        }else{
            $list = Db::name("purchasedetail")->where(["IsDelete"=>0,"Status"=>0])->order("Id asc")->limit(0,"10")->select();
        }
        //$list = Db::name("process")->where(["start_status"=>0])->limit(100)->order("id asc")->select();
        foreach ($list as $key => $val){
            //$re = startProcess($val["id"]);
            $data["CommodityId"] = $val["CommodityId"];
            $data["ErpOrderDetailNo"] = $val["ErpOrderDetailNo"];
            $data["PurchaseDetailId"] = $val["Id"];
            $re = Db::name("process")->insert($data);
            if($re){
                $myfile = fopen($file."/cron/addprocess.txt", "w") or die("Unable to open file!");
                $txt = $val["Id"];
                fwrite($myfile, $txt);
                fclose($myfile);
            }
        }
    }*/


}

