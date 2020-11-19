import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _chenkBoxItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
          children: [
            CheckboxListTile(
              value: _chenkBoxItemA,
              onChanged: (value){
                setState(() {
                  _chenkBoxItemA = value;
                });
              },
              title: Text("Checkbox Item A"), //大标题
              subtitle: Text("Description"), // 小标题
              secondary: Icon(Icons.bookmark), // 图片
              selected: _chenkBoxItemA, //文字图片的选中状态
              activeColor: Colors.red,
        ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //勾选框
//                Checkbox(
//                  value: _chenkBoxItemA,
//                  onChanged: (value){
//                    setState(() {
//                      _chenkBoxItemA = value;
//                    });
//                  },
//                  activeColor: Colors.yellow, //选中状态下背景颜色
//                  checkColor: Colors.red, //选中状态下图片颜色
//                  focusColor: Colors.green,
//                  hoverColor: Colors.blue,
//                )
              ],
            )
          ],

        ),
      ),
    );
  }
}
