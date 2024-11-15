import 'package:flutter/material.dart';
import 'dart:async';

class introduceScreen extends StatefulWidget {
  @override
  _introduceScreenState createState() => _introduceScreenState();
}

class _introduceScreenState extends State<introduceScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/edu.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
