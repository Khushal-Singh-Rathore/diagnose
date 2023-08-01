import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Vibrations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 10,
        shadowColor: shadowColor,
        title: const Text('Vibration Plugin example app'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shadowColor: MaterialStateProperty.all(shadowColor),
                      backgroundColor: MaterialStateProperty.all(lightRed)),
                  child: Text(
                    'Vibrate for default 500ms',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Vibration.vibrate();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shadowColor: MaterialStateProperty.all(shadowColor),
                      backgroundColor: MaterialStateProperty.all(lightRed)),
                  child: Text('Vibrate for 1000ms',
                      style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Vibration.vibrate(duration: 1000);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shadowColor: MaterialStateProperty.all(shadowColor),
                      backgroundColor: MaterialStateProperty.all(lightRed)),
                  child: Text('Vibrate with pattern',
                      style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text(
                        'Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate 2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Vibration.vibrate(
                      pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shadowColor: MaterialStateProperty.all(shadowColor),
                      backgroundColor: MaterialStateProperty.all(lightRed)),
                  child: Text('Vibrate with pattern and amplitude',
                      style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text(
                        'Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate 2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s',
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Vibration.vibrate(
                      pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                      intensities: [0, 128, 0, 255, 0, 64, 0, 255],
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
