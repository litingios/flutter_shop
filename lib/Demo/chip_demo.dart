import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    "豹子头 林冲",
    "玉麒麟 卢俊义",
    "行者 武松",
    "花和尚 鲁智深",
    "一丈青 扈三娘",
    "九纹龙 史进",
    "小李广 花荣",
    "霹雳火 秦明",
  ];

  String _actionChip = "Nothing";
  List<String> _selected = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
            children: [
              Wrap(
                spacing: 8.0, // 横向间距
                runSpacing: 8.0, //纵向间距
                children: [
                  Chip(
                    label: Text('黑白双剑'),
                    backgroundColor: Colors.red,
                  ),
                  Chip(
                    label: Text('赏善罚恶二使'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('le'),
                    ),
                  ),
                  Chip(
                    label: Text('丁不三'),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
                      ),
                      child: Text('le'),
                    ),
                  ),
                  Chip(
                    label: Text('石破天'),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
                      ),
                      child: Text('le'),
                    ),
                  ),
                  Chip(
                    label: Text('谢烟客'),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
                      ),
                      child: Text('le'),
                    ),
                  ),
                  Chip(
                    label: Text('贝海石'),
                    onDeleted: () {},
                    deleteIcon: Icon(Icons.delete_forever_sharp),
                    deleteIconColor: Colors.blue,
                    deleteButtonTooltipMessage: 'Remove this tag',
                  ),
                  Divider(
                    color: Colors.red,
                    height: 5.0,
                    indent: 5.0, //前面缩进
                    endIndent: 5.0, //后面缩进
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        backgroundColor: Colors.blue,
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.red,
                    height: 5.0,
                    indent: 5.0, //前面缩进
                    endIndent: 5.0, //后面缩进
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('ActionChip: $_actionChip'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _tags.map((tag) {
                      return ActionChip(
                        label: Text(tag),
                        backgroundColor: Colors.blue,
                        onPressed: (){
                          setState(() {
                            _actionChip = tag;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.red,
                    height: 5.0,
                    indent: 5.0, //前面缩进
                    endIndent: 5.0, //后面缩进
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('FilterChip: ${_selected.toString()})'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _tags.map((tag) {
                      return FilterChip(
                        label: Text(tag),
                        backgroundColor: Colors.blue,
                        selected: _selected.contains(tag),
                        onSelected: (value){
                          setState(() {
                            if(_selected.contains(tag)){
                              _selected.remove(tag);
                            }else{
                              _selected.add(tag);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.red,
                    height: 5.0,
                    indent: 5.0, //前面缩进
                    endIndent: 5.0, //后面缩进
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('FilterChip: （${_choice.toString()})'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _tags.map((tag) {
                      // 单选
                      return FilterChip(
                        label: Text(tag),
                        backgroundColor: Colors.blue,
                        selectedColor: Colors.red,
                        selected: _choice == tag, //如果相等返回true
                        onSelected: (value){
                          setState(() {
                            _choice = tag;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          )],
        ),
      ),
    );
  }
}
