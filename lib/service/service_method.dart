import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

// 通用方法
Future request(url,{formData})async{
  try{
    print('开始获取数据...............');
    // 展示加载动画
    Response response;
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000 ; //请求超时限制
    dio.options.receiveTimeout = 3000 ;
    dio.interceptors.add(LogInterceptor(requestBody: false));//是否开启请求日志

//    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    if(formData==null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url],data:formData);
    }

    if(response.statusCode==200){
      return response.data;

      // 结束加载动画

    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      // 结束加载动画

    }
  }catch(e){
    return print('ERROR:======>${e}');
    // 结束加载动画

  }

}