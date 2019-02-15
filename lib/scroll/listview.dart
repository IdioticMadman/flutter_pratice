import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListViewState();
  }
}

class _ListViewState extends State<ListViewDemo> {
  static const BOTTOM_FLATG = "****flag****";
  var _words = <String>[BOTTOM_FLATG];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewDemo'),
      ),
      body: buildBody(),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Name List"),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _words.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_words[index] == BOTTOM_FLATG) {
                    if (_words.length - 1 < 100) {
                      //不足100条,显示加载更多
                      _retrieveData();
                      return buildLoading();
                    } else {
                      return buildNoMore();
                    }
                  }
                  return ListTile(
                    title: Text(_words[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: .0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNoMore() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "没有更多数据了",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget buildLoading() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 24.0,
        height: 24.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
