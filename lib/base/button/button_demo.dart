import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Raised Button"),
              onPressed: () => print("Raiesd Button"),
            ),
            FlatButton(
              child: Text("Flat Button"),
              onPressed: () => print("Flat Button"),
            ),
            OutlineButton(
              child: Text("Outline Button"),
              onPressed: () => print("Outline Button"),
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => print("Icon Button"),
            ),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
