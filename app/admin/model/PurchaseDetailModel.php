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

class PurchaseDetailModel extends BaseModel{

    public static function returnName(){
        return "purchasedetail";
    }
    public static function PurchaseDetail(){
        return new PurchaseDetailModel(self::returnName());
    }
    public  function returnField(){
        return ['Id','FactoryId','PurchaseListId','Status','CommodityId','Quantity','OrderId','OrderDetailId','ErpOrderDetailNo','Remark','ProduceStatus','ProduceLastUpdateTime','CurrentProcedureCodes','CompleteProcedureCodes','ProcedureStartTime','ProcedureEndTime','WithholdMoney','LastWithholdTime','AddTime','IsDelete'];
    }
    public static function getcount($id){
        Db::name(self::returnName())->where(["Id"=>$id])->count();
    }
}
