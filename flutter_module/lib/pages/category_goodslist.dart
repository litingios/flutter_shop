import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_module/shopmodel/categoryGoodsList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/catagory_goodslist.dart';
import '../provide/child_category.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'details_page.dart';
import 'package:flutter_module/loading/net_loadingios.dart';

//商品列表，可以上拉加载
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  @override
  void initState() {
    super.initState();
  }

  Widget _goodsImage(List list,int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: FadeInImage.assetNetwork(
        image: list[index].image,
        placeholder: 'img/placeholder_avatar.png' /* 指定gif */,
        fit: BoxFit.cover,
    ),
    );
  }

  Widget _goodsName(List list,int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPrice(List list,int index) {
    return Container(
        margin: EdgeInsets.only(left: 5.0),
        width: ScreenUtil().setWidth(370),
        child: Row(children: <Widget>[
          Text(
            '￥${list[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ]));
  }

  Widget _ListWidget(List list,int index) {
    return InkWell(
        onTap: () {
          // 界面跳转
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(list[index].goodsId),
              ));
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
//          decoration: BoxDecoration(
//              border:
//                  Border(bottom: BorderSide(width: 1.0, color: Colors.red))),
          child: Column(
            children: [
              _goodsImage(list,index),
              _goodsName(list,index),
              _goodsPrice(list,index),
            ],
          ),
        ));
  }

  var scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {

    return Provide<CategoryGoodsListProvide>(
      builder: (context,child,data){

        try{
          if(Provide.value<ChildCategory>(context).page == 1){
            // 列表位置 回到顶部
            scrollController.jumpTo(0);
          }
        }catch(e){
          print('第一次进入界面${e}');
        }

        if (data.goodsList.length > 0){
          return Expanded(
            child: Container(
                color: Color.fromRGBO(239, 239, 239, 1.0),
                width: ScreenUtil().setWidth(570),
//              height: ScreenUtil().setHeight(960),
                padding: EdgeInsets.all(0.0),
                child: EasyRefresh(
                  header: ClassicalHeader(
                    bgColor: Colors.white,
                    textColor: Color.fromRGBO(233, 31, 126, 1.0),
                    infoColor: Color.fromRGBO(233, 31, 126, 1.0),
                    infoText: '努力加载中',
                    refreshedText: '我要撤了',
                    refreshText: '加载完成',
                    refreshingText: '加载中',
                    refreshReadyText: '开始加载',
                    showInfo: true,
                    noMoreText: '',
                  ),
                  footer: ClassicalFooter(
                    bgColor: Colors.white,
                    textColor: Color.fromRGBO(233, 31, 126, 1.0),
                    infoColor: Color.fromRGBO(233, 31, 126, 1.0),
                    noMoreText: Provide.value<ChildCategory>(context).noMoreText,
                    infoText: '努力加载中',
                    loadedText: '我要撤了',
                    loadText: '加载完成',
                    loadingText: '努力加载中',
                    loadReadyText: '开始加载',
                    showInfo: true,
                  ),
                  child: GridView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.goodsList.length,
//                  physics: NeverScrollableScrollPhysics(), 禁止滑动代码
                    padding: EdgeInsets.symmetric(horizontal: 0), // 距离左右两边
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 0.5,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return _ListWidget(data.goodsList,index);
                    },
                  ),
                  onLoad:() async {
                    print('上拉加载更多...');

                    if(Provide.value<ChildCategory>(context).noMoreText=='没有更多了'){
                      Fluttertoast.showToast(
                          msg: "已经到底了",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.pink,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else{
                      _getMoreGoodList();
                    }

                  },
                ),
            ),
          );
        }else{
          return Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '暂无数据',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
              ],
            )
          );
        }
      },
    );
  }


  void _getMoreGoodList() async {

    Loading.showLoading(context);
    Provide.value<ChildCategory>(context).addPage();
    //dio 3.0.0为了支持Flutter Web，需要进行较大重构，因此无法直接兼容2.1.x，
    //如果你是2.1.x的用户，可以参照此文档升级到3.0，详情请查看 从2.1升级到3.0指南 。
    FormData data = FormData.fromMap({
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId':Provide.value<ChildCategory>(context).subId,
      'page':Provide.value<ChildCategory>(context).page
    });

    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if(goodsList.data == null){
        // 将小类别数组赋值给全局的Provide来管理
        Provide.value<ChildCategory>(context).changeNoMore('没有更多了');
        Loading.hideLoading(context);

      }else{
        // 将小类别数组赋值给全局的Provide来管理
        Provide.value<CategoryGoodsListProvide>(context).addGoodsList(goodsList.data);
        Loading.hideLoading(context);

      }
    });
  }

}
