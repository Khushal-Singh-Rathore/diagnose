import 'dart:async';

import 'package:converter/screens/GreyScale/greyScale.dart';
import 'package:flutter/material.dart';

class GreyScaleTest extends StatefulWidget {
  @override
  State<GreyScaleTest> createState() => _GreyScaleTestState();
}

class _GreyScaleTestState extends State<GreyScaleTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => GreyScale()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[800],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[700],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[600],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[500],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[400],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[300],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[200],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }
}
