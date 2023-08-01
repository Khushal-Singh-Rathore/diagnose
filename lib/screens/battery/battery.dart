// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:async';

import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryClass extends StatefulWidget {
  const BatteryClass({Key? key}) : super(key: key);

  @override
  State<BatteryClass> createState() => BatteryClassState();
}

class BatteryClassState extends State<BatteryClass> {
  final Battery _battery = Battery();

  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  @override
  void initState() {
    super.initState();
    _battery.batteryState.then(_updateBatteryState);
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen(_updateBatteryState);
  }

  void _updateBatteryState(BatteryState state) {
    if (_batteryState == state) return;
    setState(() {
      _batteryState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Battery Details'),
        elevation: 8,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_batteryState',
              style: TextStyle(fontSize: 24, color: lightRed),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(shadowColor),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(lightRed)),
              onPressed: () {
                _battery.batteryLevel.then(
                  (batteryLevel) {
                    showDialog<void>(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: lightRed,
                        content: Text('Battery: $batteryLevel%'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(color: bgColor),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Get battery level'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(shadowColor),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(lightRed)),
              onPressed: () {
                _battery.isInBatterySaveMode.then(
                  (isInPowerSaveMode) {
                    showDialog<void>(
                      barrierColor: bgColor,
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: lightRed,
                        title: const Text(
                          'Is in Battery Save mode?',
                          style: TextStyle(fontSize: 20),
                        ),
                        content: Text(
                          "$isInPowerSaveMode",
                          style: const TextStyle(fontSize: 18),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(color: bgColor),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Is in Battery Save mode?'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }
}
