import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'details_page.dart';

class FloorTitle extends StatelessWidget {
  final String picture_address; // 图片地址
  FloorTitle({this.picture_address});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(239, 239, 239, 1.0),
      padding: EdgeInsets.all(3.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品组件
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({this.floorGoodsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

  Widget _firstRow(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context,floorGoodsList[1]),
            _goodsItem(context,floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorGoodsList[3]),
        _goodsItem(context,floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(BuildContext context,Map goods){

    return Container(
      width:ScreenUtil().setWidth(375),
      child: InkWell(
        onTap:(){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(goods['goodsId']),
              ));
        },
        child: Image.network(goods['image']),
      ),
    );
  }

}