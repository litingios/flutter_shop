import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_module/shopmodel/swiper_model.dart';
import 'package:flutter_module/provide/currentIndex.dart';
import 'package:provide/provide.dart';
import 'package:flutter_module/shopmodel/category.dart';
import 'package:flutter_module/provide/child_category.dart';
import 'package:flutter_module/service/service_method.dart';
import 'dart:convert';

class TopNavgator extends StatelessWidget {
  final List<SwiperModel> navgaterList;

  TopNavgator({this.navgaterList});

  Widget _gridViewItemUI(BuildContext context,item,index){
    return InkWell(
      onTap: (){
        _goCategory(context,index,item.mallCategoryId);
      },
      child: Column(
        children: [

          FadeInImage.assetNetwork(
            image: item.image,
            placeholder: 'img/placeholder_avatar.png' /* 指定gif */,
            width: ScreenUtil().setWidth(95),
          ),

          SizedBox(height: ScreenUtil().setHeight(8),),
          Text(
            item.mallCategoryName,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _goCategory(context,int index,String categroyId) async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      List   list = category.data;
      Provide.value<ChildCategory>(context).changeCategory(categroyId,index);
      Provide.value<ChildCategory>(context).getChildCategory( list[index].bxMallSubDto,categroyId);
      Provide.value<CurrentIndexProvide>(context).changeIndex(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 截取数组长度
    if(this.navgaterList.length > 10){
      this.navgaterList.removeRange(10, this.navgaterList.length);
    }

    var tempIndex=-1;

    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(340),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        // 禁止滑动
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 5, //一行5个
        padding: EdgeInsets.all(5.0),
        mainAxisSpacing: ScreenUtil().setHeight(12),
        children: navgaterList.map((item){
          tempIndex++;
          return _gridViewItemUI(context,item,tempIndex);
        }).toList(),

      ),
    );
  }
}

