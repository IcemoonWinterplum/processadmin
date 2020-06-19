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
namespace app\admin\model;

use think\Model;
use think\facade\Cache;
use think\Db;
use app\admin\model\BaseModel;

class PurchaseListModel extends BaseModel{
    public $tablename = "purchaselist";

    public static function returnName(){
        return "purchaselist";
    }
    public static function PurchaseListDetail(){
        return new PurchaseListModel(self::returnName());
    }
    public  function returnField(){
        return ['Id','FactoryId','Status','PurchaseNo','ConfirmTime','UpdateTime','CompleteTime','Remark','CreateMagUserId','AddTime','IsDelete'];
    }
    public static function getcount($id){
        Db::name(self::returnName())->where(["Id"=>$id])->count();
    }
}
