import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://www.google.com/');
    Future<void> launchUrlFunc() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not lauch, Check your mobile data!');
      }
    }

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 10,
          shadowColor: shadowColor,
          title: const Text('Mobile Data'),
        ),
        body: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  shadowColor: MaterialStateProperty.all(shadowColor),
                  backgroundColor: MaterialStateProperty.all(lightRed)),
              onPressed: () {
                launchUrlFunc();
              },
              child: Text(
                'Launch Google.com',
                style: TextStyle(fontSize: 25),
              )),
        ));
  }
}
