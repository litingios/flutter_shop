import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'swiper_diy.dart';
import 'package:flutter_module/shopmodel/swiper_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'top_navgator.dart';
import 'adbanner_data.dart';
import 'recommend_goods.dart';
import 'floor_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'details_page.dart';
import 'package:flutter_module/routers/application.dart';
import 'package:flutter_module/loading/net_loading.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];

  @override
  void initState() {
    super.initState();
  }

  // 保持页面的效果
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    FormData formData = FormData.fromMap({
      'lon': '116.47118377685547',
      'lat': '39.91233444213867'
    });
    EasyRefreshController _controller = new EasyRefreshController();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '百姓生活+',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: FutureBuilder(
          // FutureBuilder 异步请求 加渲染组件
          future: request('homePageContext', formData: formData),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());

              // 轮播数据
              List<SwiperModel> swiperDataList = [];
              List moduleData = data['data']['slides'];
              moduleData.forEach((data) {
                swiperDataList.add(SwiperModel.fromJson(data));
              });

              // category数据
              List<SwiperModel> categoryList = [];
              List categoryListData = data['data']['category'];
              categoryListData.forEach((data) {
                categoryList.add(SwiperModel.fromJson(data));
              });

              // 客服电话
              String adPicture =
                  data["data"]['advertesPicture']['PICTURE_ADDRESS'];
              String leaderImage =
                  data['data']['shopInfo']['leaderImage']; //店长图片
              String leaderPhone =
                  data['data']['shopInfo']['leaderPhone']; //店长电话
              //商品推荐
              List<Map> recommendList =
                  (data['data']['recommend'] as List).cast(); // 商品推荐

              String floor1Title =
                  data['data']['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
              String floor2Title =
                  data['data']['floor2Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
              String floor3Title =
                  data['data']['floor3Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
              List<Map> floor1 =
                  (data['data']['floor1'] as List).cast(); //楼层1商品和图片
              List<Map> floor2 =
                  (data['data']['floor2'] as List).cast(); //楼层1商品和图片
              List<Map> floor3 =
                  (data['data']['floor3'] as List).cast(); //楼层1商品和图片

              return EasyRefresh(
//                enableControlFinishRefresh: true,
//                enableControlFinishLoad: true,
                controller: _controller,
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
                  noMoreText: '没数据了...',
                  infoText: '努力加载中',
                  loadedText: '我要撤了',
                  loadText: '加载完成',
                  loadingText: '努力加载中',
                  loadReadyText: '开始加载',
                  showInfo: true,
                ),
                child: ListView(
                  // 轮播图
                  children: <Widget>[
                    SwiperDiy(
                      swiperDataList: swiperDataList,
                      height: ScreenUtil().setHeight(333),
                    ), //页面顶部轮播组件
                    TopNavgator(
                      navgaterList: categoryList,
                    ),
                    AdBanner(
                      adPicture: adPicture,
                    ),
                    LeaderPhone(
                      leaderImage: leaderImage,
                      leaderPhone: leaderPhone,
                    ),
                    Recommend(recommendList: recommendList),
                    FloorTitle(picture_address: floor1Title),
                    FloorContent(floorGoodsList: floor1),
                    FloorTitle(picture_address: floor2Title),
                    FloorContent(floorGoodsList: floor2),
                    FloorTitle(picture_address: floor3Title),
                    FloorContent(floorGoodsList: floor3),
                    _hotGoods(),
                  ],
                ),
                onLoad: () async {
                  print('开始加载更多');
                  FormData formPage = FormData.fromMap({
                    'page': page
                  });
                  await request('homePageBelowConten', formData: formPage)
                      .then((val) {
                    var data = json.decode(val.toString());
                    List<Map> newGoodsList = (data['data'] as List).cast();
                    if (newGoodsList.length < 20){
                      _controller.finishLoad(success: true,noMore: false);
                    }
                    setState(() {
                      hotGoodsList.addAll(newGoodsList);
                      page++;
                    });
                  });
                },
                onRefresh: () async {
                  _controller.finishRefresh(success: true);
                },
              );

            } else {
              return Center(
                child: ProgressDialog(
                  loading: true,
                  msg: '正在加载...',
                  child: Center(
                    child: RaisedButton(
                      child: Text('显示加载动画'),
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          child: Text(
            ' 火 ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              backgroundColor: Color.fromRGBO(233, 31, 126, 1.0),
            ),
          ),
          borderRadius: BorderRadius.circular(40.0),
          shadowColor: Color.fromRGBO(233, 31, 126, 1.0),
          elevation: 5.0,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Text(
          '火爆专区',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );

//火爆专区子项
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              // 界面跳转
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(val['goodsId']),
                  ));
            },
            child: Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    image: val['image'],
                    placeholder: 'img/cover.jpg' /* 指定gif */,
                    width: ScreenUtil().setWidth(372),
                  ),

                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromRGBO(233, 31, 126, 1.0),
                        fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val['mallPrice']}'),
                      Text(
                        '￥${val['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
            ));
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text(' ');
    }
  }

  //火爆专区组合
  Widget _hotGoods() {
    return Container(
        child: Column(
      children: <Widget>[
        hotTitle,
        _wrapList(),
      ],
    ));
  }
}
