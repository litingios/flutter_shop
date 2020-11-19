import 'package:flutter/material.dart';

class NavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavigationBarDemoState();
  }
}

class _NavigationBarDemoState extends State<NavigationBarDemo> {
  int _currentIndex = 0;

  void _onTapHeader(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: _currentIndex,
//      onTap: ()=> _onTapHeader,
      onTap: _onTapHeader,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
      items: [
        BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text("分类"), icon: Icon(Icons.map)),
        BottomNavigationBarItem(title: Text("购物车"), icon: Icon(Icons.shop)),
        BottomNavigationBarItem(title: Text("订单"), icon: Icon(Icons.search)),
        BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.person))
      ],
    );
  }
}
