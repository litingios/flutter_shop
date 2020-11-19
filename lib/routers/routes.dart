import 'package:flutter/material.dart';
import 'router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  // 路由管理
  static Router router;

  static String root = '/'; // 根目录
  static String detail = '/detail'; // 详情界面
  static String webView = '/webView'; // 网页加载
  static String wxSharePay = '/wxSharePay'; // 测试model传参

  // 配置route
  static void configureRoutes(Router router) {
    // 未发现对应route
//    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//      print('route not found!');
//      return;
//    });

    void defineRoutes(FluroRouter router) {
      router.define(root, handler: rootHandler); // 根目录
      router.define(detail, handler: detailHandler); // 商品详情
      router.define(webView, handler: webViewHandler); // 网页加载
      router.define(wxSharePay, handler: wxSharePayHandler); // 测试model传参
    }
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
//    return router.navigateTo(context, path, transition:transition);
//    return router.navigateTo(context, "/users/1234", transition: TransitionType.fadeIn);

  }
}