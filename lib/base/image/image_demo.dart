import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageDemo"),
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/avatar.jpeg",
                  height: 200,
                ),
                Image.network(
                  "https://avatars0.githubusercontent.com/u/16788980?s=460&v=4",
                  height: 200,
                )
              ],
            ),
          )),
    );
  }
}
