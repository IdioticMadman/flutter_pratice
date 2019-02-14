import 'package:flutter/material.dart';

class TextInputDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TextInputState();
  }
}

class _TextInputState extends State<TextInputDemo> {
  TextEditingController _nameController = new TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      print(_nameController.text);
    });
    _nameController.text = "张三";
    _nameController.selection = TextSelection(baseOffset: 1, extentOffset: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (v) {
                print("onChange: $v");
              },
              focusNode: _focusNode1,
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              focusNode: _focusNode2,
            ),
            RaisedButton(
              child: Text("清除焦点"),
              onPressed: () {
                _focusNode1.unfocus();
                _focusNode2.unfocus();
              },
            ),
            RaisedButton(
              child: Text("下一个"),
              onPressed: () {
                if (null == focusScopeNode) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(_focusNode2);
              },
            )
          ],
        ),
      ),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormDemoState();
  }
}

class _FormDemoState extends State<FormDemo> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单输入"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formkey, //设置key，以便提交的时候获取
            autovalidate: true, //自动验证
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Builder(
                        builder: (context) {//注意context得是Form
                          return RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("请登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              if (Form.of(context).validate()) {
                                print("object");
                              }
                            },
                          );
                        },
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
