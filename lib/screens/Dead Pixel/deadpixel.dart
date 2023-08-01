import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';

import 'deadpixelTest.dart';

class DeadPixel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: const Text('Dead Pixel Test')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You will see 3 changing colors on your screen sopt any dead pixel in them. ',
            style: TextStyle(fontSize: 20, color: lightRed),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(shadowColor),
                  backgroundColor: MaterialStateProperty.all(lightRed)),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorChangingContainer()));
              },
              child: const Text(
                'Start',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
