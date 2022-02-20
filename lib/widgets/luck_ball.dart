import 'package:flutter/material.dart';

class LuckBall extends StatefulWidget {
  final int number;
  final bool isEnabled;
  final bool mutable;

  LuckBall({this.number, this.isEnabled = false, this.mutable = true});

  @override
  _LuckBallState createState() => _LuckBallState();
}

class _LuckBallState extends State<LuckBall> {
  bool _isEnabled;

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.isEnabled;
  }

  Color get _backgroundColor => _isEnabled ? Color(0xff01ac66) : null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          widget.number.toString().padLeft(2, '0'),
          style: TextStyle(
              fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
