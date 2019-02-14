import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文本及样式"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello World",
                textAlign: TextAlign.left,
              ),
              Text(
                "Hello world! I'm Jack" * 5,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                    text: "https://www.baidu.com",
                    style: TextStyle(color: Colors.blue)),
              ])),
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Hello World'),
                    Text("I am Jack"),
                    Text(
                      'I am Jack',
                      style: TextStyle(inherit: false, color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
