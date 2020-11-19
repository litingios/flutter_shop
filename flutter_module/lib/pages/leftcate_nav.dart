import 'package:flutter/material.dart';
import 'package:flutter_module/shopmodel/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_module/shopmodel/category.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import 'package:flutter_module/shopmodel/categoryGoodsList.dart';
import '../provide/catagory_goodslist.dart';
import '../provide/category_smallIndex.dart';
import "package:dio/dio.dart";
import 'package:flutter_module/loading/net_loadingios.dart';


class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  var listIndex = 0; //索引
  List list = [];

  @override
  void initState() {
    _getCategory();
//    _getGoodList();
    super.initState();
  }

  void _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());

      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      //默认选中第一个大类的数据
      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
    });
  }

  void _getGoodList({String categoryId}) async {

    if (categoryId.length > 0){
      Loading.showLoading(context);
    }

    //dio 3.0.0为了支持Flutter Web，需要进行较大重构，因此无法直接兼容2.1.x，
    //如果你是2.1.x的用户，可以参照此文档升级到3.0，详情请查看 从2.1升级到3.0指南 。
    FormData data = FormData.fromMap({
      'categoryId': categoryId == null ? "2c9f6c946cd22d7b016cd74220b70040" : categoryId,
      'categorySubId':'',
      'page':'1'
    });

    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      // 将小类别数组赋值给全局的Provide来管理
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);

      if (categoryId.length > 0){
        Loading.hideLoading(context);
      }

    });
  }

  Widget _leftWellItem(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;
        Provide.value<ChildCategory>(context)
            .getChildCategory(childList, list[index].mallCategoryId);
        _getGoodList(categoryId:categoryId);

      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 15),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.black12),
            )),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftWellItem(index);
        },
      ),
    );
  }
}
