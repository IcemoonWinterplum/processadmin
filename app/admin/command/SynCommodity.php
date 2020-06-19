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

class SynCommodity extends Command
{
    protected function configure()
    {
        $this->setName('SynCommodity')->setDescription("同步产品信息");
    }
    protected function execute(Input $input, Output $output){

        $file = dirname(dirname(dirname(__DIR__)));
        $start = 0;
        if(file_exists($file."/cron/SynComodityfile.txt")){
            $start = file_get_contents($file."/cron/SynComodityfile.txt");
        }
        if($start){
            $sqld = "select TOP(100) *  from commodity where Id > $start order by Id asc";
        }else{
            $sqld = "select TOP(100) *  from commodity order by Id asc";
        }
        $data = sqlServer($sqld);
       // $data = sqlServer($sqld);
        //var_dump($data);die;
        foreach ($data as $hey => $val){
            if(!CommodityModel::getcount($val["Id"])){
                $addcommodity = CommodityModel::addData($val);
                if($addcommodity){
                    $myfile = fopen($file."/cron/SynComodityfile.txt", "w") or die("Unable to open file!");
                    $txt = $val["Id"];
                    fwrite($myfile, $txt);
                    fclose($myfile);
                }
            }
        }

    }


}

