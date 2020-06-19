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

class SynPurchaseList extends Command
{
    protected function configure()
    {
        $this->setName('SynPurchaseList')->setDescription("同步采购单列表");
    }
    protected function execute(Input $input, Output $output){
        $file = dirname(dirname(dirname(__DIR__)));
        $start = 0;
        if(file_exists($file."/cron/SynPurchaseList.txt")){
            $start = file_get_contents($file."/cron/SynPurchaseList.txt");
        }
        if($start){
            $sqld = "select TOP(100) *  from PurchaseList where Id > $start order by Id asc";
        }else{
            $sqld = "select TOP(100) *  from PurchaseList order by Id asc";
        }
        $data = sqlServer($sqld);
        //var_dump($data);
        foreach ($data as $hey => $val){
            if(!PurchaseListModel::getcount($val["Id"])){
                $addcommodity = PurchaseListModel::PurchaseListDetail()->addData($val);
                if($addcommodity){
                    $myfile = fopen($file."/cron/SynPurchaseList.txt", "w") or die("Unable to open file!");
                    $txt = $val["Id"];
                    fwrite($myfile, $txt);
                    fclose($myfile);
                }
            }
        }
    }


}

