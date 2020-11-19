import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';
import '../pages/home_page.dart';
import '../pages/member_page.dart';
import '../pages/web_url.dart';

// 根目录
var rootHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomePage();
});

// 详情界面 - 传递商品id参数
var detailHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return DetailsPage('2');
});

// 网页加载 - 示例：传多个字符串参数
var webViewHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  // params内容为  {title: [我是标题哈哈哈], url: [https://www.baidu.com/]}
  String title = params['title']?.first;
  String url = params['url']?.first;
  return WebViewUrlPage(

  );
});

// 示例：传多个model参数
var wxSharePayHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {

//  UserInfoModel _model1 =
//  UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel'][0]));
//  UserInfoModel _model2 =
//  UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel2'][0]));

  return DetailsPage('2');
});