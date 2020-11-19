import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_module/shopmodel/swiper_model.dart';
import 'details_page.dart';

// 轮播组件
class SwiperDiy extends StatelessWidget {
  final List <SwiperModel>swiperDataList;
  final double height;

  // 初始化
  SwiperDiy({
    this.swiperDataList,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Swiper(
        // 构建view
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index].image}",fit:BoxFit.fill);
        },
        // 图片个数
        itemCount: swiperDataList.length,
        onTap: (index){
          // 界面跳转
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(swiperDataList[index].goodsId),
              ));
        },

//        viewportFraction: 0.8,
//        scale: 0.9,

        // 指示器 小红点
        pagination: SwiperPagination(
          builder: SwiperPagination.dots,
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.bottomRight,
        ),
        autoplay: true,
      ),
    );
  }
}