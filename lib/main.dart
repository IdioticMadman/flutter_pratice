import 'package:flutter/material.dart';
import 'package:flutter_pratice/base/counter.dart';
import 'package:flutter_pratice/base/state_control.dart';
import 'package:flutter_pratice/base/text/text_demo.dart';
import 'package:flutter_pratice/base/text/text_input_demo.dart';
import 'package:flutter_pratice/base/button/button_demo.dart';
import 'package:flutter_pratice/base/image/image_demo.dart';
import 'package:flutter_pratice/base/check/swich_check_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/base_counter": (context) => CounterWidget(
              initValue: 0,
            ),
        "/state_self": (context) => TapBox(),
        "/text_demo": (context) => TextDemo(),
        "/button_demo": (context) => ButtonDemo(),
        "/image_demo": (context) => ImageDemo(),
        "/switch_demo": (context) => SwitchAndCheckBoxDemo(),
        "/text_input_demo": (context) => FormDemo(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            child: Text("counter"),
            onPressed: () {
              Navigator.pushNamed(context, '/base_counter');
            },
          ),
          RaisedButton(
            child: Text("state_self"),
            onPressed: () {
              Navigator.pushNamed(context, '/state_self');
            },
          ),
          RaisedButton(
            child: Text("text_demo"),
            onPressed: () {
              Navigator.pushNamed(context, '/text_demo');
            },
          ),
          RaisedButton(
            child: Text("text_input_demo"),
            onPressed: () {
              Navigator.pushNamed(context, '/text_input_demo');
            },
          ),
          RaisedButton(
            child: Text("button_demo"),
            onPressed: () {
              Navigator.pushNamed(context, '/button_demo');
            },
          ),
          RaisedButton(
            child: Text("image_demo"),
            onPressed: () {
              Navigator.pushNamed(context, '/image_demo');
            },
          ),
          RaisedButton(
            child: Text("switch_demo"),
            onPressed: () {
              Navigator.pushNamed(context, '/switch_demo');
            },
          )
        ],
      ),
    );
  }
}

