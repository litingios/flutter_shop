import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //适配包

// 单纯图片
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({this.adPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        adPicture,
      ),
    );
  }
}


// 拨打电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({
    this.leaderImage,
    this.leaderPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(
          leaderImage,
          height: ScreenUtil().setHeight(220),
        ),
        onTap: null,
      ),
    );
  }

  void _callPhone() async {
    String url = 'tel:'+leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}



