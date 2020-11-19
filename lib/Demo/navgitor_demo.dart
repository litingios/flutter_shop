import 'package:flutter/material.dart';
import 'package:flutter_module/Model/post.dart';

class NavgitorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            FlatButton(
              child: Text(
                "Home",
              ),
              onPressed: null,
            ),
            FlatButton(
                child: Text("About"),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (BuildContext context) => Page(title: "About",)
//                ),
//              );
                })
          ],
        ),
      ),
    );
  }
}

// 不要使用 Page 这个名字，现在是关键字
class Page01 extends StatelessWidget {
  final String title;

  Page01({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: ListView(
        children: [GuessLikeOnlyList()],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class GuessLikeOnlyList extends StatelessWidget {
  Widget renderHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '猜你喜欢',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '更多',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF666666),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            ClipRRect(
              child: Image.network(
                posts[index].imageUrl,
                fit: BoxFit.cover,
                height: 100,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            Text(
              posts[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // 显示...文字不显示全
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              posts[index].author,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this.renderHeader(),
          this.renderBody(),
        ],
      ),
    );
  }
}


class GuessLikeList extends StatelessWidget {
  Widget renderHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '猜你喜欢',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '更多',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF666666),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            ClipRRect(
              child: Image.network(
                posts[index].imageUrl,
                fit: BoxFit.cover,
                height: 100,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            Text(
              posts[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // 显示...文字不显示全
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              posts[index].author,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this.renderHeader(),
          this.renderBody(),
        ],
      ),
    );
  }
}


