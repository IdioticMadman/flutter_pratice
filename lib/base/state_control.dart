// 管理自身状态
import 'package:flutter/material.dart';

class TapBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("state_control"),
      ),
      body: ParentWidgetC(),
    );
  }
}

class TapBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TapboxAState();
  }
}

class _TapboxAState extends State<TapBoxA> {
  bool _active = false;

  void handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        child: new Center(
          child: Text(_active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// ParentWidget 为 TapboxB 管理状态.
class ParentWidgetB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetBState();
  }
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: new Text(active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// 父控件和子空间一起协调
class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(
        active: _active,
        onChange: _handleTapBoxChanged,
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  const TapBoxC({
    Key key,
    this.active = false,
    this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive'),
        ),
        decoration: new BoxDecoration(
            color: widget.active ? Colors.green[700] : Colors.grey[600],
            border: _highlight
                ? new Border.all(color: Colors.teal[700], width: 10.0)
                : null),
      ),
    );
  }
}
