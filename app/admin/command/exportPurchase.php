<?php

namespace app\admin\command;

use app\admin\service\StockService;
use think\cache\driver\Redis;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;
use \api\home\controller\ActivityController as apimodel;
use think\Config;

class exportPurchase extends Command
{
    /*
    * 此任务是将process流程表中的流程开始，并将流程分配各对应人员
    * */

    protected function configure()
    {
        $this->setName('exportPurchase')->setDescription("导出采购单");
    }


    protected function execute(Input $input, Output $output){
        $list = Db::name("process")->where(["start_status"=>0])->limit(0,100)->order("id asc")->select();
        foreach ($list as $key => $val){
            $data = StockService::getStockBySku($val["Sku"]);
            if(isset($data[0]) && $data[0]){
                StockService::queenStock($val["id"],$val["ErpOrderDetailNo"]);
                continue;
            }
            $result = startProcess($val["id"]);
        }
    }


}

