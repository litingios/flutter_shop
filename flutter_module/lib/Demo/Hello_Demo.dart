import 'package:flutter/material.dart';
import 'package:flutter_module/Demo/Basic_Demo.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichTextDemo();
  }
}

class ahah extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "hello",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}