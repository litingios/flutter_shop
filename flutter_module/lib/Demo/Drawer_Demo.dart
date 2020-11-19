import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "李婷婷",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("13161138626@163.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img-tailor.11222.cn/bcv/big/201801131700391513.jpg"),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage(
                        "http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.hardLight))),
          ),
          ListTile(
            title: Text(
              "清除缓存",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.search),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "清除缓存",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.search),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "清除缓存",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.search),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
