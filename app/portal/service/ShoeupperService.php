<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\portal\service;

use app\portal\model\PortalPostModel;
use think\db;
use think\process\pipes\Unix;

class ShoeupperService{
    public $sku;

    public function __construct($sku)
    {
        $this->sku = $sku;
    }

    /**
     * 审单
     * @param $filter
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function examinePaper($filter){
        $recode = Db::name("commodity")->where(["skku"=>$this->sku])->find();
        if($recode){
            return false;
        }else{
            return true;
        }
    }

    /**
     * 分配下料
     * @param $filter
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */

    public function distributionBlanking(){

    }
}