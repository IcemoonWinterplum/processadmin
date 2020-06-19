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

class SynCommodityinfo extends Command
{
    protected function configure()
    {
        $this->setName('SynCommodityinfo')->setDescription("同步产品烧花,3D,印花");
    }
    protected function execute(Input $input, Output $output){
        $file = dirname(dirname(dirname(__DIR__)));
        $start = 0;
        if(file_exists($file."/cron/SynCommodityinfo.txt")){
            $start = file_get_contents($file."/cron/SynCommodityinfo.txt");
        }
        if($start){
            $sqld = "select TOP(100) Face,WaterTableModel,WoodHeelModel  from commodity where Id > $start order by Id asc";
        }else{
            $sqld = "select TOP(100)  Face,WaterTableModel,WoodHeelModel  from commodity order by Id asc";
        }
        $data = sqlServer($sqld);
        // $data = sqlServer($sqld);
        //var_dump($data);die;
        foreach ($data as $hey => $val){
            if(!Db::name("commodityinfo")->where(["commodityid"=>$val["Id"]])->find()){
                $datasource["commodityid"] = $val["Id"];
                $datasource["3Dmodel"] = $val["Id"];//3D文件
                $datasource["openboard"] = $val["Id"];//印花
                $datasource["tracing"] = $val["Id"];//烧花
                $addcommodity = Db::name("commodityinfo")->insert($datasource);
                if($addcommodity){
                    $myfile = fopen($file."/cron/SynCommodityinfo.txt", "w") or die("Unable to open file!");
                    $txt = $val["Id"];
                    fwrite($myfile, $txt);
                    fclose($myfile);
                }
            }
        }
    }


}

