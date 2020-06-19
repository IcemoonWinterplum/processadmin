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

use think\Db;
use think\Model;
use think\facade\Cache;

class ProcessModel extends Model{
    private static $name = "process";
    private $table = "process";
    /*
     * 关联产品信息
     * */
    private  $commodity;

    /*
     * 产品id
     * */
    private $id = null;

    /*
     * 产品信息
     * */
    public static function commodity(){

    }

    public static function processinfo($field = null,$condition = null){
        $data = Db::name(self::$name)->paginate(10);
        return $data;
    }
}
