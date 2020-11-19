import 'package:flutter/material.dart';
import 'package:flutter_module/shopmodel/details.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_module/provide/cart.dart';
import 'package:provide/provide.dart';

class DetailsInfoProvide with ChangeNotifier{

  DetailsModel goodsInfo =null;
  bool isLeft = true;
  bool isRight = false;

  //从后台获取商品信息

  getGoodsInfo(String id )async{
    FormData formData = FormData.fromMap({
      'goodId': id,
    });
    await request('getGoodDetailById',formData:formData).then((val){
      var responseData= json.decode(val.toString());
      goodsInfo=DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
    notifyListeners();
  }


}