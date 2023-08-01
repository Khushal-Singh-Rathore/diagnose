import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';

import 'greyScaleText.dart';

class GreyScale extends StatefulWidget {
  @override
  State<GreyScale> createState() => GreyScaleState();
}

class GreyScaleState extends State<GreyScale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Grey Scale Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a grey scale test, means you will see 8 different shades of grey on your screen.',
              style: TextStyle(color: lightRed, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(shadowColor),
                    backgroundColor: MaterialStateProperty.all(lightRed)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GreyScaleTest()));
                },
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
