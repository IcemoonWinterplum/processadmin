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

class CommodityModel extends Model{

    public static function returnName(){
        return "Commodity";
    }

    public static function returnField(){
        return ["Id","Name","PurchasePrice","RetailPrice","Sku","Spu","Weight","Image","Size","Color","AircraftBoard","HeelNum","Other","Status","TotalCount","StockCount","Face","ShoeLast","Bottom","BrandId","BrandName","BaitingPrice","FacePrice","BelongPerson","WaterTableModel","WoodHeelModel","AddTime","IsDelete"];
    }

    /*
     * 插入数据前先完成数据验证
     * para：
     *      array $data:要插入的数据数组
     * return:
     *      array $data:验证后可以插入的数组
     * */
    public static function dataVerification($data){
        if($data && is_array($data)){
            $temp = [];
            $field = self::returnField();
            foreach ($data as $key =>$val){
                if(in_array($key,$field)){
                    $temp["$key"] = $val;
                }
            }
            return $temp;
        }else{
            return false;
        }
    }

    /*
     * 数据插入
     * */

    public static function addData($data){
        $data = self::dataVerification($data);
        return Db::name(self::returnName())->insert($data);
    }

    /*
     * 验证记录存在数量
     * para：
     *      string/array $codition : 记录的条件（非必须）
     * */
    public static function VerificationRecord($codition = null){
        if($codition){
            return Db::name(self::returnName())->where($codition)->count();
        }else{
            return Db::name(self::returnName())->count();
        }
    }

    /*
     * 返回满足条件的记录
     * para:
     *       string/array $codition : 记录的条件（非必须）;
     *       string $field : 返回的字段（非必须）；
     * */

    public static function SelectRecord($codition = null,$field = null){
        if($codition){
            if($field){
                return Db::name(self::returnName())->field($field)->where($codition)->select();
            }
            return Db::name(self::returnName())->where($codition)->select();
        }
        return Db::name(self::returnName())->select();
    }

    /*
     * */
    public static function getcount($id){
        Db::name(self::returnName())->where(["Id"=>$id])->count();
    }
}
