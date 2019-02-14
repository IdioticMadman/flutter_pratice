import 'package:flutter/material.dart';

class SwitchAndCheckBoxDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SwitchAndCheckState();
  }
}

class _SwitchAndCheckState extends State<SwitchAndCheckBoxDemo> {
  bool _swichSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkbox"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Switch(
              value: _swichSelected,
              onChanged: (value) {
                setState(() {
                  _swichSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
