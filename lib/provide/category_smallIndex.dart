import 'package:flutter/material.dart';

class CategorySubIdProvide with ChangeNotifier{

  String categorySubId = '';

  //点击小类时更换商品列表
  getCategorySubId(String categorySubId){
    categorySubId = categorySubId;
    notifyListeners();

  }

}