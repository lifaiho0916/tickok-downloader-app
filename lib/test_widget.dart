import 'dart:async';

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isVisible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _resetTimer();
      },
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(
            child: Text(
              'My Widget',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 3), () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  void _resetTimer() {
    _timer!.cancel();
    setState(() {
      _isVisible = true;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
