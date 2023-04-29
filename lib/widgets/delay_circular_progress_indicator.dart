import 'package:flutter/material.dart';

class DelayedCircularProgressIndicator extends StatefulWidget {
  final int delay;

  DelayedCircularProgressIndicator({required this.delay});

  @override
  _DelayedCircularProgressIndicatorState createState() =>
      _DelayedCircularProgressIndicatorState();
}

class _DelayedCircularProgressIndicatorState
    extends State<DelayedCircularProgressIndicator> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    print("initstate = ${_isLoading}");
    // Start loading after the specified delay
    Future.delayed(Duration(milliseconds: widget.delay), () {
      setState(() {
        _isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    print("loading = ${_isLoading}");

    return _isLoading
        ? CircularProgressIndicator()
        : Container();
  }
}