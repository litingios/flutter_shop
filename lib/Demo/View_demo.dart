import 'package:flutter/material.dart';
import 'package:flutter_module/Model/post.dart';

class ViewDemo extends StatelessWidget{
  Widget _pageitembuilder(BuildContext context,int index){
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            'https://img-tailor.11222.cn/bcv/big/201810081316355892.jpg',
            fit:BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  fontSize: 34.0
                ),
              ),
              Text(
                posts[index].author,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    fontSize: 34.0
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageitembuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(

//      pageSnapping: false, 拖动时离左边近靠左边，右边近靠右边
//      reverse: true, 是否倒叙
//      scrollDirection: Axis.vertical, //滚动方向
      // 滑动的回调
      onPageChanged: (currentPage) => debugPrint("Page: $currentPage"),
      controller: PageController(
          initialPage: 1, //默认显示哪个视图
          keepPage: false, // 是否保持用户原来的状态
          viewportFraction: 0.85 // 可视范围
      ),
      children: [
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            "ONE",
            style: TextStyle(color: Colors.white,fontSize: 32.0),

          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            "TWO",
            style: TextStyle(color: Colors.white,fontSize: 32.0),

          ),
        ),
        Container(
          color: Colors.blue[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            "THREE",
            style: TextStyle(color: Colors.white,fontSize: 32.0),

          ),
        )
      ],
    );
  }
}