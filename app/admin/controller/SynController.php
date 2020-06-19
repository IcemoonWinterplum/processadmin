<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\CommodityModel;
use cmf\controller\HomeBaseController;
use think\Request;
use think\Session;
use think\Db;

class SynController extends HomeBaseController
{
        public function SynCommodity(){
            $file = dirname(dirname(dirname(__DIR__)));
            $start = 0;
            if(file_exists($file."/cron/SynComodityfile.txt")){
                $start = file_get_contents($file."/cron/SynComodityfile.txt");
            }
            if($start){
                $sqld = "select TOP(10) *  from commodity where Id > $start order by Id asc";
            }else{
                $sqld = "select TOP(10) *  from commodity order by Id asc";
            }
            echo phpinfo();

            $test=new \PDO('sqlsrv:Server=47.52.39.211;Database=ErpDB20200315','sa','r5V$d@ec7UDp!@#');
            foreach ($test->query('SELECT * FROM Commodity') as $row) {
                var_dump($row);
            };
            exit;
            $data = connectsqlserver($sqld);
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