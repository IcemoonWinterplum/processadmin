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
namespace app\admin\service;

use think\Db;

class StockService{
    /**
     * 获取所有库存的流程
     *
     *
     * */
    public static function getAllstock(){
        return Db::name("process_stock")->alias("a")->field("a.id,a.process_id,b.CommodityId,b.Sku,b.ErpOrderDetailNo,b.PurchaseDetailId")->join("process b","a.process_id = b.id","left")->select();
    }

    /**
     * 获取sku的库存
     *      para: string : sku
     */
    public static function getStockBySku($sku){
        return Db::name("process_stock")->alias("a")->field("a.id,a.process_id,b.CommodityId,b.Sku,b.ErpOrderDetailNo,b.PurchaseDetailId")->join("process b","a.process_id = b.id","left")->where(["b.Sku"=>$sku,"a.status"=>0])->select();
    }

    /**
     * 获取库存相同sku原始订单信息
     *      para:
     *          para: string : sku
     *
     */

    public static function getSkuOrdeInfo($sku ="FJ8021133D09"){
        $dataorder = self::getStockBySku($sku);
        $str = "";
        if($dataorder){
            foreach ($dataorder as $key =>$val){
                $str .= $str ? ",'".$val["ErpOrderDetailNo"]."'" : "'".$val["ErpOrderDetailNo"]."'";
            }
        }
        if($str){
            $sql = "select a.*,b.* from OrderDetail a left join Commodity b on a.CommodityId = b.Id WHERE a.ErpOrderDetailNo in($str)";
            $data = sqlServer($sql);
            foreach ($data as $key => $val){
                foreach ($dataorder as $ke => $va){
                    if($val["ErpOrderDetailNo"] == $va["ErpOrderDetailNo"] ){
                        $data["$key"] ["process_id"] = $va["process_id"];
                    }
                }
            }
            return $data;
        }else{
            return false;
        }
    }

    /**
     *
     * 暂时绑定库存的流程
     *      para:int id :流程id
     * */
    public static function bandStock($id,$band_process_id){
        //return Db::name("process_stock")->where([])
        return Db::name("process_stock")->where(["process_id"=>$id])->update(["band_process_id"=>$band_process_id]);
    }

    /**
     *流程存在相似库存，添加到队列表里面
     * */
    public static function queenStock($process_id,$ErpOrderDetailNo){
        if(!Db::name("queen_stock")->where(["process_id"=>$process_id])->find()){
            return Db::name("queen_stock")->insert(["process_id"=>$process_id,"ErpOrderDetailNo"=>$ErpOrderDetailNo]);
        }else{
            return false;
        }

    }

    /**
     * 根据内部订单号获取订单数据
     * */
    public static function getOrderByErpOrderDetailNo($ErpOrderDetailNo){
        $sql = "select a.*,b.* from OrderDetail a left join Commodity b on a.CommodityId = b.Id WHERE a.ErpOrderDetailNo='$ErpOrderDetailNo'";//新流程里面的订单信息
        $data = sqlServer($sql);
        return $data;
    }
    /**
     * 返回队列流程
     * */
    public static function queenStockData(){
        return Db::name("queen_stock")->alias("a")->field("a.process_id,b.Sku,b.ErpOrderDetailNo,b.addtime")->join("process b","a.process_id=b.id","left")->paginate(10);
    }

    /**
     * 开启某个库存流程
     *      para:
     *          $stock : 库存的内部订单
     *          $process_ErpOrderDetailNo:新流程的订单号
     * */
    public static function openStock($stock,$process_ErpOrderDetailNo){
        $newprocess = Db::name("process")->where(["ErpOrderDetailNo"=>$process_ErpOrderDetailNo])->find();
        $stock_process = Db::name("process")->alias("a")->field("a.*,b.status")->join("process_stock b","a.id=b.process_id","left")->where(["a.ErpOrderDetailNo"=>$stock])->find();
        if($newprocess["start_status"] != 0){
            return json(["code"=>500,"msg"=>"新订单已经开始，无法启用库存"]);
        }
        if($stock_process["status"] != 0){
            return json(["code"=>500,"msg"=>"库已经开启！不能二次使用"]);
        }
        if($stock_process){
            $data["examinePaper"] = $stock_process["examinePaper"];
            $data["openboard"]    = $stock_process["openboard"];
            $data["tracing"]      = $stock_process["tracing"];
            $data["distributionBlanking"] = $stock_process["distributionBlanking"];
            $data["mixedIngredients"] = $stock_process["mixedIngredients"];
            $data["accessories"] = $stock_process["accessories"];
            $data["makeFace"] = $stock_process["makeFace"];
            $data["examinePaperbottom"] = $stock_process["examinePaperbottom"];
            $data["threeD"] = $stock_process["threeD"];
            $data["last"] = $stock_process["last"];
            $data["outsole"] = $stock_process["outsole"];
            $data["midsole"] = $stock_process["midsole"];
            $data["totalmixedIngredients"] = $stock_process["totalmixedIngredients"];
            $data["makeBottom"] = $stock_process["makeBottom"];
            $data["drill"] = $stock_process["drill"];
            $data["stickingPad"] = $stock_process["stickingPad"];
            $data["inspection"] = $stock_process["inspection"];
            $data["packing"] = $stock_process["packing"];
            $data["deliver"] = $stock_process["deliver"];
            Db::startTrans();
            try{
                if($stock_process["start_status"] == 2 || $data["packing"] == 1){//如果库存的流程已经完成或者已经到包装流程了 则直接跳到包装流程（要重新包装）
                    $data["packing"]=0;
                    $data["deliver"]=0;
                }
                $update = $data;
                $update["start_status"] = 1;//将新流程的状态改为开始
                Db::name("process")->where(["ErpOrderDetailNo"=>$process_ErpOrderDetailNo])->update($update);//修改新流程各阶段状态
                Db::name("queen_stock")->where(["process_id"=>$newprocess["id"]])->delete();//绑定库存后，删除当前队列中对应的新流程
                Db::name("process_stock")->where(["process_id"=>$stock_process["id"]])->update(["status"=>1,"band_process_id"=>$newprocess["id"]]);//绑定库存后，将更新库存的流程表中改库存的状态和绑定对应流程的id
                $face = ["openboard","tracing","distributionBlanking","accessories","makeFace"];//鞋面流程
                $bottom = ["threeD","last","outsole","midsole"];//鞋底流程
                $totalmixe = ["totalmixedIngredients","makeBottom","drill","stickingPad","inspection","packing","deliver"];//总流程
                $face_con = false;
                $bottom_con= false;
                foreach ($data as $key => $val){
                    if($val == 0){
                        if(in_array($key,$face)){//库存的流程在鞋面部分
                            if($face_con == false){
                                ProcessService::startProcess($newprocess["id"],$key);
                                $face_con = true;
                            }else{
                                continue;
                            }
                        }//开启面部任务
                        if(in_array($key,$bottom)){//库存的流程在鞋底部分
                            if($bottom_con == false){
                                ProcessService::startProcess($newprocess["id"],$key);
                                $bottom_con = true;
                            }else{
                                continue;
                            }
                        }//开启鞋底任务
                       if(in_array($key,$totalmixe)){////库存的流程在总配料后
                           if($bottom_con || $face_con){
                               break;
                           }else{
                               ProcessService::startProcess($newprocess["id"],$key);
                               break;
                           }
                       }//开启总配料任务
                    }
                }
                Db::commit();
                return json(["code"=>200,"msg"=>"启用库存已经完成"]);
            } catch (\ErrorException $e){
                Db::rollback();
                return json(["code"=>500,"msg"=>$e->getMessage()]);
            }
        }
    }

}