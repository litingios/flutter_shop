import 'package:flutter/material.dart';

class SwifchDemo extends StatefulWidget {
  @override
  _SwifchDemoState createState() => _SwifchDemoState();
}

class _SwifchDemoState extends State<SwifchDemo> {
  bool _switchItemA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwifchDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
          children: [
            SwitchListTile(
              value: _switchItemA,
              onChanged: (value){
                setState(() {
                  _switchItemA = value;
                });
              },
              title: Text("点击送好礼"),
              subtitle: Text("好礼s送不停"),
              selected: _switchItemA,
              secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              activeTrackColor: Colors.red,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.yellowAccent,

        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_switchItemA ? '😁' : '😐', style: TextStyle(fontSize: 32.0),),
//                Switch(
//                  value: _switchItemA,
//                  activeColor: Colors.red,
//                  onChanged: (value){
//                    setState(() {
//                      _switchItemA = value;
//                    });
//                  },
//                ),
              ],
            )
          ],

        ),
      ),
    );
  }
}
