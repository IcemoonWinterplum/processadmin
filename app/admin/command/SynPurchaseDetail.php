<?php

namespace app\admin\command;

use think\cache\driver\Redis;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;
use \api\home\controller\ActivityController as apimodel;
use think\Config;
use app\admin\model\PurchaseDetailModel;

class SynPurchaseDetail extends Command
{
    protected function configure()
    {
        $this->setName('SynPurchaseDetail')->setDescription("同步采购单详情");
    }
    protected function execute(Input $input, Output $output){
        $start = 0;
        $file = dirname(dirname(dirname(__DIR__)));
        if(file_exists($file."/cron/SynPurchaseDetail.txt")){
            $start = file_get_contents($file."/cron/SynPurchaseDetail.txt");
        }
        if($start){
            $sqld = "select TOP(100) *  from PurchaseDetail where Id > $start order by Id asc";
        }else{
            $sqld = "select TOP(100) *  from PurchaseDetail order by Id asc";
        }
        $data = sqlServer($sqld);
        //var_dump($data);
        foreach ($data as $hey => $val){
            if(!PurchaseDetailModel::getcount($val["Id"])){
                $addcommodity = PurchaseDetailModel::PurchaseDetail()->addData($val);
                if($addcommodity){
                    $myfile = fopen($file."/cron/SynPurchaseDetail.txt", "w") or die("Unable to open file!");
                    $txt = $val["Id"];
                    fwrite($myfile, $txt);
                    fclose($myfile);
                }
            }
        }
    }


}

