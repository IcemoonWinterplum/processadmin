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

class SynUrgentOrderDetail extends Command
{
    protected function configure()
    {
        $this->setName('SynUrgentOrderDetail')->setDescription("同步加急单列表");
    }
    protected function execute(Input $input, Output $output){
        $file = dirname(dirname(dirname(__DIR__)));
        $start = 0;
        if(file_exists($file."/cron/SynUrgentOrderDetail.txt")){
            $start = file_get_contents($file."/cron/SynUrgentOrderDetail.txt");
        }
        if($start){
            $sqld = "select TOP(100) *  from UrgentOrderDetail where Id > $start order by Id asc";
        }else{
            $sqld = "select TOP(100) *  from UrgentOrderDetail order by Id asc";
        }
        $data = sqlServer($sqld);
        //var_dump($data);
        foreach ($data as $hey => $val){
            if(!Db::name("urgentorderdetail")->field("Id")->where(["Id"=>$val["Id"]])->find()){
                $addcommodity = Db::name("urgentorderdetail")->insert($val);
                if($addcommodity){
                    $myfile = fopen($file."/cron/SynUrgentOrderDetail.txt", "w") or die("Unable to open file!");
                    $txt = $val["Id"];
                    fwrite($myfile, $txt);
                    fclose($myfile);
                }
            }
        }
    }


}

