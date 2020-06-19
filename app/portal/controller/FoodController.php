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
use think\Db;

class FoodController extends HomeBaseController
{
    public function  alllist()
    {
        //echo json_encode( $json );
        return $this->fetch();
    }

    public function pagelist(){
        $page = $this->request->param("page");
        $keywords = $this->request->param("keywords");
        //echo $page;die();
        if(trim($keywords)){
            //die("keywords");
            $list = Db::name("food")->where("name like '%$keywords%'")->limit(($page-1)* 10,10)->order("id desc")->select()->toArray();
        //echo  Db::name("food")->getLastSql();die();
        }else{
            $list = Db::name("food")->limit(($page-1)* 10,10)->order("id desc")->select()->toArray();
        }
        //echo Db::name("food")->getLastSql();
        //var_dump($list);die(0);
        foreach ($list as $ke => $val){
             $list[$ke]["img_head"] =  "http://". $_SERVER['SERVER_NAME']."/upload/".$val["img_head"];
        }
        //var_dump($list);die();
        echo json_encode($list);
        // 把分页数据赋值给模板变量list
        //$this->assign('list', $list);
    }

    /*
     * 美食详情
     * para: id => int
     * */
    public function fooddetail(){

        $id = $this->request->param("id");
        $data = DB::name("food")->where(["id"=>$id])->find();
        $this->assign('food', $data);
        return $this->fetch();
    }
}
