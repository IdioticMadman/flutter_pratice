import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContainerDemo'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 120.0),
        constraints: BoxConstraints.tightFor(width: 200.0, height: 120.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: <Color>[Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 10.0,
              ),
            ]),
        transform: Matrix4.rotationZ(.2),
        alignment: Alignment.center,
        child: Text(
          "5.20",
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}

class ScaffoldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScaffoldState();
  }
}

class _ScaffoldState extends State<ScaffoldDemo>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  TabController _tabController; //自定义一个controller

  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold Demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("share");
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((f) => Tab(
                    text: f,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs
            .map((e) => Container(
                  alignment: Alignment.center,
                  child: Text(e, textScaleFactor: 5),
                ))
            .toList(),
      ),
      drawer: MyDrawerDemo(),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("float click");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          SizedBox(),
          IconButton(
            icon: Icon(Icons.business),
            onPressed: () {},
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.business), title: Text("Business")),
        BottomNavigationBarItem(
            icon: Icon(Icons.school), title: Text("School")),
      ],
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
    );
  }
}

class MyDrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 38.0),
            child: Row(
              children: <Widget>[
                Padding(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/avatar.jpeg",
                      width: 80,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                ),
                Text(
                  "Robert",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add account"),
                ),
                ListTile(
                  title: Text("Manage account"),
                  leading: Icon(Icons.settings),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
