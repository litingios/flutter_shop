import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form'),
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.blue
        ),
        child: Container(
          padding: EdgeInsets.all(16.0), //设置内边距
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterText()
            ],

          ),
        ),
      ),
    );
  }
}


class RegisterText extends StatefulWidget {
  @override
  _RegisterTextState createState() => _RegisterTextState();
}

class _RegisterTextState extends State<RegisterText> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  void submitRegisterForm() {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();

    debugPrint('username: $username');
    debugPrint('password: $password');
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("注册中。。。。。。。。"),
      )
    );
}

// 验证用户名是否空
String validatorUserName(value){
    if(value.isEmpty){
      return 'Username is Empty.';
    }
    return null;
}

// 验证密码是否空
String validatorPassWorld(value){
    if(value.isEmpty) {
      return 'PassWrold is Empty.';
    }
    return null;
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: '用户名',
              helperText: '',
            ),
            onSaved: (value){
              username = value;
            },
            validator: validatorUserName,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: '密码',
              helperText: '',
            ),
            onSaved: (value){
              password = value;
            },
            validator: validatorPassWorld,
          ),
          SizedBox(height: 32.0,),
          Container(
            width: double.maxFinite,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}


class TextFiledDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextFiledDemo> {
  // 创建文本编辑控制器去监听文本框的变化
  final editTextController = TextEditingController();

  // 不使用时销毁 editTextController 节约资源
  @override
  void dispose() {
    // TODO: implement dispose
    editTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editTextController.text = "hello";
    editTextController.addListener(() {
      debugPrint('input: ${editTextController.text}');
    });

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
//      onChanged: (value){
//        debugPrint('input $value');
//      },
      controller: editTextController,
      onSubmitted: (value){
        debugPrint('submit $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.shop),
        labelText: "请输入姓名/邮箱/手机号", // 上面文字
        hintText: "请输入姓名/邮箱/手机号", // 站位文字
//        border: InputBorder.none, // 底部边框隐藏
//        border: OutlineInputBorder() //添加四周边框
        filled: true, // 允许设置背景颜色
        fillColor: Colors.red // 设置背景颜色

      ),
      cursorColor: Colors.green, // 光标颜色
    );
  }
}

class ThemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
