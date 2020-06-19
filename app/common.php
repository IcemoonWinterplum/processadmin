<?php
/**
 * Created by PhpStorm.
 * User: sain
 * Date: 2019/6/16
 * Time: 15:43
 */

use think\Image;
use cmf\lib\Storage;
use think\Db;
use think\Config;
/*use PHPExcel_IOFactory;*/
/*
 * 图片上传
 * para : file => 对象 可以通过 $this->request->file('file')获取
 * */
error_reporting(E_ERROR | E_WARNING | E_PARSE);
function imgUpload($file)
 {

     $result = $file->validate([
         'ext' => 'jpg,jpeg,png,gif',
         'size' => 1024 * 1024
     ])->move(WEB_ROOT . 'upload' . DIRECTORY_SEPARATOR . 'imgup' . DIRECTORY_SEPARATOR);

     if ($result) {
         $avatarSaveName = str_replace('//', '/', str_replace('\\', '/', $result->getSaveName()));
         $avatar = 'imgup/' . $avatarSaveName;
         session('avatar', $avatar);
         return json_encode([
             'code' => 1,
             "msg" => "上传成功",
             "data" => ['file' => $avatar],
             "url" => ''
         ]);
     } else {
         return json_encode([
             'code' => 0,
             "msg" => $file->getError(),
             "data" => "",
             "url" => ''
         ]);
     }
 }

// 图片裁剪
function avatarUpdate($w, $h, $x, $y)
{
    $avatar = session('avatar');
    if (!empty($avatar)) {

        $avatarPath = WEB_ROOT . "upload/" . $avatar;
        $avatarImg = Image::open($avatarPath);
        $avatarImg->crop($w, $h, $x, $y)->save($avatarPath);

        $result = true;
        if ($result === true) {
            $storage = new Storage();
            $result  = $storage->upload($avatar, $avatarPath, 'image');
            //var_dump($avatar);
            //$userId = cmf_get_current_user_id();
            //Db::name("user")->where("id", $userId)->update(["avatar" => $avatar]);
            //session('user.avatar', $avatar);
            //$this->success("头像更新成功！");
            return $avatar;
        } else {
            return false;
        }

    }
}

/*
 * 流程
 * para:
 *      string $current_process :当前流程
 *      int $process_id :当前流程的id
 *      string return  :next/previous 返回值，默认是下一流程
 * return:
 *      str $next(下一流程标识ep：examinePaper)/ blool false
 * */
function process($current_process,$return = "next"){
     /*
      * 鞋面流程
      * */
    $process_ex = [
        "examinePaper" => "鞋面审单",
        "openboard" => "开板",
        "tracing" => "描版",
        "distributionBlanking" =>"配料",
        "mixedIngredients"=>"下料",
        "accessories"=>"配辅料",
        "makeFace" =>"做面"
    ];
    /*
     * 鞋底流程
     * */
     $process_bottom= [
         "examinePaperbottom"=>"鞋底审单",
         "threeD"=>"3D",
         "last"=>"楦",
         "outsole"=>"大底",
         "midsole"=>"中底",

     ];
     /*
      * 综合流程
      * */
    $process_add = [
        "totalmixedIngredients"=>"总配料",
        "makeBottom"=>"做底",
        "drill"=>"打眼",
        "stickingPad"=>"洗清洁",
        "inspection"=>"品检",
        "packing"=>"包装",
        "deliver"=>"交付"
    ];
    $next = null;
    $process_ex_finish = false;
    $process_bottom_finish = false;
    $previous = false;
    switch ($current_process){
             case "examinePaper":
                $next = "distributionBlanking";
                 $previous = false;
                break;
             case "openboard":
                $next = "tracing";
                 $previous = "examinePaper";
                break;
             case "tracing":
                 $next = "distributionBlanking";
                 $previous = "openboard";
                 break;
             case "distributionBlanking":
                 $next = "accessories";
                 $previous = "tracing";
                 break;
             /*case "mixedIngredients":
                 $previous = "distributionBlanking";
                 $next ="accessories";break;*/
             case "accessories":
                    //$previous = "mixedIngredients";
                    $previous = "distributionBlanking";
                    $next ="makeFace";break;
             case "makeFace":
                 $previous = "accessories";
                 $next = "totalmixedIngredients";
                 $process_ex_finish = true;break;
                 /*鞋底流程*/
             /*case "examinePaperbottom":
                 $next = "threeD";break;*/
             case "threeD":
                 $previous = "examinePaperbottom";
                 $next = "totalmixedIngredients";break;
             case "last":
                 $previous = "examinePaperbottom";
                 $next = "totalmixedIngredients";break;
             case "outsole":
                 $previous = "examinePaperbottom";
                 $next = "totalmixedIngredients";break;
             case "midsole":
                 $previous = "examinePaperbottom";
                 $next = "totalmixedIngredients";
                 $process_bottom_finish = "totalmixedIngredients";break;
                 /*综合流程*/
             case "totalmixedIngredients":
                 $previous=["threeD","last","outsole","midsole","makeFace"];
                 $next = "makeBottom";break;
             case "makeBottom":
                 $previous = "totalmixedIngredients";
                 $next = "drill";break;
             case "drill":
                 $previous = "makeBottom";
                $next = "stickingPad";break;
             case "stickingPad":
                 $previous = "drill";
                 $next = "inspection";break;
             case "inspection":
                $previous = "stickingPad";
                $next = "packing";break;
              case "packing":
                  $previous = "stickingPad";
                  $next = "deliver";break;
             default:
                 return false;
         }
         /*if($process_ex_finish || $process_bottom_finish){
             $status = Db::name("process")->field("midsole,makeFace")->where(["id"=>$process_id])->find();
             if($status["makeFace"] && $status["midsole"]){
                 $next = "totalmixedIngredients";
             }else{
                 return "wait";
             }
         }*/
         if($return == "next"){
             return $next;
         }
    return $previous;
}

/*
 * 任务分配
 * para:
 *      string $next_process : 下一流程
 * */
function distribution($next_process){
        $users = \think\Db::name("user")->select();
        var_dump($users);
}
/*
 * 返回各个流程对应的组
 * para :
 *      STRING $process :流程对应的组
 * return:
 *      int $process_group : 对应的组权限数字
 * */

function group($process=null){
    $process_group = [
        "examinePaper" => 3,
        "distributionBlanking" =>4,
        /*"mixedIngredients"=>5,*/
        "makeFace" =>6,
        "examinePaperbottom"=>7,
        "threeD"=>8,
        "last"=>9,
        "outsole"=>10,
        "midsole"=>11,
        "totalmixedIngredients"=>12,
        "makeBottom"=>13,
        "drill"=>14,
        "stickingPad"=>15,
        "packing"=>16,
        "deliver"=>18,
        "manual"=>17,
        "openboard" => 19,
        "tracing" => 20,
        "inspection"=>21,
        "accessories"=>22,
    ];
    if($process){
        return $process_group["$process"];
    }else{
        return $process_group;
    }

}

/*
 * 返回各个流程对应的名字
 * para
 *      string $process :流程代号
 * return
 *      string string $process_ex：流程对应中文名
 * */
function processname($process= null){
    $process_ex = [
        "examinePaper" => "鞋面审单",
        "openboard" => "开板",
        "tracing" => "描版",
        "distributionBlanking" =>"配料下料",
        /*"mixedIngredients"=>"下料",*/
        "accessories"=>"配辅料",
        "makeFace" =>"做面",
        "examinePaperbottom"=>"鞋底审单",
        "threeD"=>"3D",
        "last"=>"楦",
        "outsole"=>"大底",
        "midsole"=>"中底",
        "totalmixedIngredients"=>"总配料",
        "makeBottom"=>"做底",
        "drill"=>"打跟",
        "stickingPad"=>"洗清洁",
        "inspection"=>"品检",
        "packing"=>"包装",
        "deliver"=>"交付"
    ];
    if($process){
        return $process_ex["$process"];
    }
    return $process_ex;
}
/*
 * 返回组对应的人员
 * para：
 *      int groupid : 组对应的id
 * return:
 *      array $data:返回流程任务分配者的 user_id、user_login、mobile
 * */

function users($groupid){
    /*$data = Db::name("role_user")
                ->alias("a")
                ->field("a.user_id,b.user_login,b.user_nickname,count(c.id) as current")
                ->join("user b","a.user_id = b.id","left")
                ->join("task c","a.user_id = c.userid","left")
                ->where(["a.role_id"=>$groupid,"b.user_status"=>1])
                ->group("a.user_id,b.user_login,b.user_nickname")
                ->order("current asc")
                ->find();*/
    //所有正常人员名单
    $data = Db::name("role_user")
        ->alias("a")
        ->field("a.user_id,b.user_login,b.user_nickname")
        ->join("user b","a.user_id = b.id","left")
        ->where(["a.role_id"=>$groupid,"b.user_status"=>1])
        ->select();
    //var_dump($data);
    $arr = [];
    $arr1 = [];
    foreach ($data as $key => $val){
        $arr[] = $val["user_id"];
        $arr1[$val["user_id"]] = 0;
    }
    $comn = join(',',$arr);
    $data1 = Db::name("task")->field("userid,count(id) as total")->where("userid in ($comn) and status=0")->group("userid")->select();
    //echo Db::name("task")->getLastSql();
    //var_dump($data1);
    foreach ($data1 as $ke => $va){
        $arr1[$va["userid"]] = $va["total"];
    }
    asort($arr1);
    //var_dump($arr1);
    $rand_array = [];
    if($arr1){
        $min =  reset ($arr1);
        //var_dump($arr1);
        foreach ($arr1 as $k => $v){
            if($v == $min){
                $rand_array[] = $k;
            }
        }
        //echo "***********************";
        //var_dump($rand_array);
        $key = array_rand($rand_array);
        $uid = $rand_array["$key"];
        $retu = ["user_id"=>$uid];
        foreach ($data as $key => $val){
            if($uid == $val["user_id"]){
                $retu["user_login"] = $val["user_login"];
                $retu["user_nickname"] = $val["user_nickname"];
            }
        }
        //var_dump($retu);
        //die;
        return $retu;
    }else{
        return false;
    }
    //echo  Db::name("role_user")->getLastSql();
    return $data;
}
/*
 * 开始流程
 * para:
 *      int  $processId :流程的id
 * */

function startProcess($processId)
{
    if ($processId) {
        $code = Db::name("task")->where(["process_id" => $processId])->count();
        if ($code > 1) {
            return false;
        } else {
            $name1 = "examinePaper";//鞋面审单
            $name2 = "examinePaperbottom";//鞋底审单
            $next1 = group($name1);//鞋面审单人员所在组
            $next2 = group($name2);//鞋底审单人员所在组
            $user1 = users($next1);//找出鞋面人员组中任务最少的一个人
            $user2 = users($next2);//找出鞋底人员组中任务最少的一个人
            Db::startTrans();
            try{
                $result1 = Db::name("task")->insert(["userid"=>$user1["user_id"],"process_id"=>$processId,"task_type"=>$name1]);//为鞋面审单分配人员
                $result3 = Db::name("process")->where(["id"=>$processId])->update(["start_status"=>1]);
                $result2 = Db::name("task")->insert(["userid"=>$user2["user_id"],"process_id"=>$processId,"task_type"=>$name2]);//为鞋底审单分配人员
                Db::commit();
            }catch (\ErrorException $e){
                Db::rollback();
                return false;
            }
            return true;
        }
    }else{
        return false;
    }
}
/*s
 * 查询8001 sql server 数据库
 *      string $sql :sql server 查询语句
 * */

function sqlServer($sql){
    $da = Db::connect('database.db2')->query($sql);
    return $da;
    //$da = Db::connect('database.db2')->query('SELECT TOP(100) * from Commodity order by Id asc ');
    /*foreach ($da as $key => $val){
        $re = Db::name("Commodity")->insert($val);
    }*/
    var_dump($da);exit;
}

function connectsqlserver($sql){
    $db = Config::get("database");
    $db2 = $db["db2"];
    $test=new PDO('sqlsrv:Server='.$db2["hostname"].';Database='.$db2["database"],$db2["username"],$db2["password"]);
    return $test->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
}


 function ismobile()

{
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
        return true;
    }
    //此条摘自TPM智能切换模板引擎，适合TPM开发
    if (isset($_SERVER['HTTP_CLIENT']) && 'PhoneClient' == $_SERVER['HTTP_CLIENT']) {
        return true;
    }
    //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset($_SERVER['HTTP_VIA']))
        //找不到为flase,否则为true
    {
        return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
    }
    //判断手机发送的客户端标志,兼容性有待提高
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array(
            'nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile',
        );
        //从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    //协议法，因为有可能不准确，放到最后判断
    if (isset($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}
/*
 * 计算时间点到现在中间的时间
 * */
function BetweenTwoDays($data){
    $conds = strtotime(date("Y-M-d H:i:s")) - strtotime($data) ;
    return floor($conds/3600);
}

/*
 * */





