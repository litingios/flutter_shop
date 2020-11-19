import 'package:flutter/material.dart';
import 'package:flutter_module/shopmodel/category.dart';


//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier{

  // 右边顶部商品的小类别
  List<BxMallSubDto> childCategoryList = [];
  // 子类高亮索引,每次点击索引清零
  int childIndex = 0;
  String categoryId = ''; //大类id
  int categoryIndex=0; //大类索引
  String subId = ''; //子类Id
  int page = 1; //列表页数
  String noMoreText = ''; //显示没有数据的文字

  //点击大类时更换
  getChildCategory(List<BxMallSubDto> list,String id){

    page = 1; // 一切换大类page =1
    noMoreText = '';
    categoryId=id;
    childIndex=0;
    BxMallSubDto all=  BxMallSubDto();
    all.mallSubId='';
    all.mallCategoryId='';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList=[all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
  //改变子类索引
  changeChildIndex(index,String id){
    childIndex=index;
    subId = id;
    page = 1; // 一切换小类page =1
    noMoreText = '';
    notifyListeners();
  }

  //首页点击类别是更改类别
  changeCategory(String id,int index){
    categoryId=id;
    categoryIndex=index;
    subId ='';
    notifyListeners();
  }

  //增加pege方法
  addPage(){
    page++;
  }

  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }

}

