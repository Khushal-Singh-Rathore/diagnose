import 'dart:async';

import 'package:converter/screens/Dead%20Pixel/deadpixel.dart';
import 'package:converter/screens/firstScreen.dart';
import 'package:flutter/material.dart';

class ColorChangingContainer extends StatefulWidget {
  @override
  ColorChangingContainerState createState() => ColorChangingContainerState();
}

class ColorChangingContainerState extends State<ColorChangingContainer> {
  Color blueColor = Colors.blue; // Initial color
  Color redColor = Colors.red;
  Color greenColor = Colors.green; // Color to change to

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => FirstScreen()));
    });
    _startColorAnimation();
  }

  void _startColorAnimation() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        blueColor = redColor;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        blueColor = greenColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: blueColor,
    ));
  }
}
