import 'dart:ffi';

import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 10,
        shadowColor: shadowColor,
        title: const Text('Flash Light Test'),
      ),
      body: FutureBuilder<bool>(
        future: _isTorchAvailable(context),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        shadowColor: MaterialStateProperty.all(shadowColor),
                        backgroundColor: MaterialStateProperty.all(lightRed)),
                    child: const Text(
                      'Enable torch',
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () async {
                      _enableTorch(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        shadowColor: MaterialStateProperty.all(shadowColor),
                        backgroundColor: MaterialStateProperty.all(lightRed)),
                    child: const Text(
                      'Disable torch',
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      _disableTorch(context);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasData) {
            return const Center(
              child: Text('No torch available.'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<bool> _isTorchAvailable(BuildContext context) async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (_) {
      _showMessage(
        'Could not check if the device has an available torch',
        context,
      );
      rethrow;
    }
  }

  Future<void> _enableTorch(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showMessage('Could not enable torch', context);
    }
  }

  Future<void> _disableTorch(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showMessage('Could not disable torch', context);
    }
  }

  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
