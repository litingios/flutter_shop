import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
          image: NetworkImage("http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg"),
            fit: BoxFit.cover

        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.pool,
              size: 32,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            width: 90,
            height: 800,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
//              borderRadius: BorderRadius.circular(16.0),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.deepPurple,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 20,
                      spreadRadius: -0)
                ],
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
          text: "李白是诗仙",
          style: TextStyle(
            fontSize: 34.0,
            color: Colors.deepPurpleAccent,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: ",杜甫是诗圣，孙思邈是药王",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.deepOrange,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            )
          ]),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 18.0,
  );
  final String _title = "将进酒";
  final String _author = "李白";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "《$_title》---- $_author 君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。"
      "岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。"
      "钟鼓馔玉不足贵，但愿长醉不愿醒。古来圣贤皆寂寞，"
      "惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。"
      "主人何为言少钱，径须沽取对君酌。五花马、千金裘，呼儿将出换美酒，与尔同销万古愁。",
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
