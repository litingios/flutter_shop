import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_module/pages/Index_page.dart';
import 'provide/child_category.dart';
import 'package:provide/provide.dart';
import 'provide/catagory_goodslist.dart';
import 'provide/category_smallIndex.dart';
import 'provide/currentIndex.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_module/routers/routes.dart';
import './routers/application.dart';
import 'pages/details_page.dart';
import 'provide/details_info.dart';
import 'provide/cart.dart';

import 'package:flutter_module/Model/post.dart';
import 'package:flutter_module/Demo/ListView-Demo.dart';
import 'package:flutter_module/Demo/Drawer_Demo.dart';
import 'package:flutter_module/Demo/Navigation_Demo.dart';
import 'package:flutter_module/Demo/Basic_Demo.dart';
import 'package:flutter_module/Demo/layout_demo.dart';
import 'package:flutter_module/Demo/View_demo.dart';
import 'package:flutter_module/Demo/sliver_demo.dart';
import 'package:flutter_module/Demo/navgitor_demo.dart';
import 'Demo/form_demo.dart';
import 'Demo/material_components.dart';

void main() {

  var childCategory=ChildCategory();
  var catagoryGoodsListProvide=CategoryGoodsListProvide();
  var categorySubIdProvide=CategorySubIdProvide();
  var providers  =Providers();
  var detailsInfoProvide= DetailsInfoProvide();
  var currentIndexProvide  =CurrentIndexProvide();
  var cartProvide  =CartProvide();

  // 全局控制点击分类按钮的数据
  providers
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(catagoryGoodsListProvide))
    ..provide(Provider<CategorySubIdProvide>.value(categorySubIdProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide));
  runApp(ProviderNode(child:MyApp(),providers:providers));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        // 隐藏debug 图标
        debugShowCheckedModeBanner: false,
        home: IndexPage(),
        initialRoute: '/', //初始路由
        routes: {
          '/IndexPage': (context) => IndexPage(), //根路由

        },
        // 设置统一主题
        theme: ThemeData(
          primaryColor: Color.fromRGBO(233, 31, 126, 1.0),
        ),
      ),
    );
  }
}



//class App extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Home(),
//      initialRoute: '/', //初始路由
//      routes: {
//        '/form': (context) => NavgitorDemo(), //根路由
//        '/about': (context) => Page01(title: 'About'),
//        '/mdc': (context) => MaterialComponent(),
//      },
//      theme: ThemeData(primaryColor: Colors.yellow),
//    );
//  }
//}

//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 4,
//      child: Scaffold(
//        backgroundColor: Colors.grey[100],
//        appBar: AppBar(
//          title: Text('NINGHAO'),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.search),
//              tooltip: 'Search',
//              onPressed: () => debugPrint('Search button is pressed.'),
//            )
//          ],
//          elevation: 0.0,
//          bottom: TabBar(
//            unselectedLabelColor: Colors.black38,
//            indicatorColor: Colors.black54,
//            indicatorSize: TabBarIndicatorSize.label,
//            indicatorWeight: 1.0,
//            tabs: <Widget>[
//              Tab(icon: Icon(Icons.local_florist)),
//              Tab(icon: Icon(Icons.change_history)),
//              Tab(icon: Icon(Icons.directions_bike)),
//              Tab(icon: Icon(Icons.view_quilt)),
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: <Widget>[
//            ListViewDemo(),
//            SliverDemo(),
//            NavgitorDemo(),
//            ViewDemo(),
//          ],
//        ),
//        drawer: DrawerDemo(),
//        bottomNavigationBar: NavigationBarDemo(),
//      ),
//    );
//  }
//}
