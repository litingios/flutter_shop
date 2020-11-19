import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CardDemo'),
          elevation: 0.0,
        ),
        body: Container(
//          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0), // 设置间隔
          child: ListView(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0), // 设置间隔,
            children: posts.map((post) {
              return Card(
                elevation: 0.0,
                margin: EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16/9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(post.imageUrl),
                      ),
                      title: Text(post.title),
                      subtitle: Text(
                          post.author,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(post.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text('Like'.toUpperCase()),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text('Read'.toUpperCase()),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
    );
  }
}