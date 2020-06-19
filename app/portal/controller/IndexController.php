<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;
/*use sms\sms;*/
use think\Db;

class IndexController extends HomeBaseController
{
    public function index()
    {
        $order = Db::name("process")->field("ErpOrderDetailNo,Sku")->where(["start_status"=>1])->limit("10")->select();
        $str = "";
        foreach ($order as $key => $val){
            $str .= $str ?  ",'".$val['ErpOrderDetailNo']."'": "'".$val['ErpOrderDetailNo']."'";
        }
        //echo $str;die;
        $sql = "select a.*,b.Image,c.OrderTime,c.ShippingPhone,c.ShippingName,c.OrderNo from OrderDetail a left  join Commodity b on a.CommoditySku=b.Sku left join Orders c on c.Id= a.OrderId where ErpOrderDetailNo in ($str)";
        $data = sqlServer($sql);
        $strimg = "";
        foreach ($data as $k => $va){
            $tem = explode(",",$va["Image"]);
            $data[$k]["img"]=$tem[0];
            $strimg .= $strimg ?  ",'".$tem[0]."'": "'".$tem[0]."'";
        }
        $sql1 = "select SourcePath,AliyunPath from OSSFileRelation where SourcePath in($strimg)";
        $data1 = sqlServer($sql1);
        foreach ($data as $k => $va){
            foreach ($data1  as $k1 => $va1){
                    if($va["img"] == $va1["SourcePath"]){
                        $data[$k]["img"] =  $va1["AliyunPath"];
                    }
            }
        }
        //var_dump($data1);die;
        $this->assign("data",$data);
        return $this->fetch(':index');
    }

    public function search(){
        if($order = $this->request->param("ordernum")){
            $sql = "select a.OrderNo,b.ErpOrderDetailNo,c.Image from Orders a left join OrderDetail b on a.Id =b.OrderId left join Commodity c on b.CommodityId=c.Id";
            $data = sqlServer($sql);
            var_dump($data);die;
            $data = Db::name("process")
                ->alias("a")
                ->field("a.*,b.Remark as Urgent")
                ->join("urgentorderdetail b","a.ErpOrderDetailNo=b.ErpOrderDetailNo","left")
                ->where($where)
                ->order("a.id desc")
                ->paginate(10);
            $this->assign("data",$data);
            return $this->fetch(':search_order');
        }
    }

    public function test(){
        //Loader::import('extend.sms.sms');
        $ses = new  sms();
        $data = $ses->send("13076019190","测试");
        print_r($data);
    }
}
