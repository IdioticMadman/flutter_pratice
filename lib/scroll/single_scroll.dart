import 'package:flutter/material.dart';
/**
 * axisDirection 轴方向
 * controller 滑动控制器
 * physics 如何想用用户操作
 */
class SingleChildScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "qwertyuioplkjhgfdsaqwertyuioplkjhgfdsa";
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollDemo"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((t) => Text(
                        t,
                        textScaleFactor: 2.0,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
