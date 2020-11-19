import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detail_topaile.dart';
import '../provide/details_info.dart';
import 'details_bottom.dart';
import 'details_explain.dart';
import 'details_tabbar.dart';
import 'details_web.dart';
import 'package:flutter_module/loading/net_loading.dart';
import 'package:flutter_module/provide/cart.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '商品详情',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body:FutureBuilder(
            future: _getBackInfo(context) ,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        DetailsTopArea(),
                        DetailsExplain(),
                        DetailsTabBar(),
                        DetailsWeb(),
                        SizedBox(height: 50,)
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: DetailsBottom()
                    )
                  ],
                );
              }else{
                return ProgressDialog(
                  loading: true,
                  msg: '正在加载...',
                  child: Center(
                    child: RaisedButton(
                      child: Text('显示加载动画'),
                    ),
                  ),
                );
              }
            }
        )
    );
  }

  Future _getBackInfo(BuildContext context )async{

    await  Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);

    // 查询当前商品是否加入到购物车
    Provide.value<CartProvide>(context).selectCountWithGoodId(goodsId);
    return '完成加载';

  }

}