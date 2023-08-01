import 'package:converter/screens/Dead%20Pixel/deadpixel.dart';
import 'package:converter/screens/GreyScale/greyScale.dart';
import 'package:converter/screens/camera/camera.dart';

import 'package:converter/screens/flash/Flash.dart';
import 'package:converter/screens/ir/ir.dart';
import 'package:converter/screens/mic/mic.dart';
import 'package:converter/screens/mobile%20data/url.dart';
import 'package:converter/screens/compass/compass.dart';
import 'package:converter/screens/sensorPlus/sensor.dart';
import 'package:converter/screens/speaker/speaker.dart';
import 'package:converter/screens/vibration/vibration.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

import '../color/colors.dart';
import 'battery/battery.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  Widget infoDisplay(String name, String value) {
    return Text(
      '$name: $value',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Widget indiTest(
      IconData givenIcon, Color givenColor, String givenTitle, var where) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => where));
            },
            icon: Icon(
              givenIcon,
              color: givenColor,
              size: 50,
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          '   ${givenTitle}',
          style: TextStyle(color: givenColor, fontSize: 20),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: shadowColor,
        elevation: 10,
        title: const Text('Phone Diagonstics'),
      ),
      // backgroundColor: Colors.teal.shade800,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder(
                future: getInfo(),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoDisplay('Brand', data!.brand),
                      infoDisplay('Model', data.device),
                      infoDisplay('Android Version', data.version.release),
                      infoDisplay('CPU', data.board),
                    ],
                  );
                },
              ),
              Image.asset(
                'assets/images/mobile-app.png',
                width: 180,
                height: 200,
              ),
            ],
          ),
          const Text('You can select a function to test.',
              style: TextStyle(fontSize: 18)),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: GridView.count(
                padding: EdgeInsets.all(30),
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                children: [
                  indiTest(Icons.camera_alt, red, 'Camera', CameraClass()),
                  indiTest(Icons.battery_full, red, 'Battery', BatteryClass()),
                  indiTest(Icons.radar, red, 'Sensors', SensorClass()),
                  indiTest(Icons.bar_chart, red, 'Grey Scale', GreyScale()),
                  indiTest(Icons.pix_outlined, red, 'Dead Pixel', DeadPixel()),
                  indiTest(Icons.sensors, red, 'Motion Sensor', CompassClass()),
                  indiTest(Icons.light_mode, red, 'Flash', FlashLight()),
                  indiTest(Icons.adjust, red, 'Ir Blaster', IrClass()),
                  indiTest(Icons.vibration, red, 'Vibration', Vibrations()),
                  indiTest(
                      Icons.network_cell, red, 'Mobile Data', MobileData()),
                  indiTest(Icons.speaker, red, 'Speaker', Speaker()),
                  indiTest(Icons.mic, red, 'Mic', Mic()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
