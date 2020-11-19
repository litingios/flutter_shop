import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_module/shopmodel/category.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import '../provide/category_smallIndex.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_module/shopmodel/categoryGoodsList.dart';
import '../provide/catagory_goodslist.dart';
import "package:dio/dio.dart";
import 'package:flutter_module/loading/net_loadingios.dart';


//右侧小类类别
class RightCategoryNav extends StatefulWidget {
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {

  void _getGoodList({String categoryId,String subId}) async {

    Loading.showLoading(context);
    //dio 3.0.0为了支持Flutter Web，需要进行较大重构，因此无法直接兼容2.1.x，
    //如果你是2.1.x的用户，可以参照此文档升级到3.0，详情请查看 从2.1升级到3.0指南 。
    FormData data = FormData.fromMap({
      'categoryId': categoryId,
      'categorySubId':subId,
      'page':'1'
    });

    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if(goodsList.data == null){
        // 将小类别数组赋值给全局的Provide来管理
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
        Loading.hideLoading(context);
      }else{
        // 将小类别数组赋值给全局的Provide来管理
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
        Loading.hideLoading(context);
      }
    });
  }


  Widget _rightInkWell(int index,BxMallSubDto item){
    bool isClick = false;
    isClick =(index==Provide.value<ChildCategory>(context).childIndex)?true:false;
    return InkWell(
      onTap: (){
        Provide.value<ChildCategory>(context).changeChildIndex(index,item.mallSubId);
        _getGoodList(categoryId:item.mallCategoryId,subId: item.mallSubId);
      },
      child: Container(
        padding:EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              right: BorderSide(width: 1,color: Colors.white),
            )
        ),

        child: Text(
          item.mallSubName,
          style: TextStyle(
              fontSize:ScreenUtil().setSp(28),
            color: isClick?Color.fromRGBO(233, 31, 126, 1.0):Colors.black,

          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text('${childCategory.childCategoryList.length}'),
        child: Provide<ChildCategory>(
          builder: (context,child,childCategory){
            return Container(
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(570),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 1,color: Colors.black12)
                    )
                ),
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: childCategory.childCategoryList.length,
                  itemBuilder: (context,index){
                    return _rightInkWell(index,childCategory.childCategoryList[index]);
                  },
                )
            );
          },
        )
    );
  }
}

