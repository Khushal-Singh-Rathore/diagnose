import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../color/colors.dart';

class Speaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          elevation: 10, shadowColor: shadowColor, title: Text('Speaker Test')),
      body: Center(
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shadowColor: MaterialStateProperty.all(shadowColor),
                backgroundColor: MaterialStateProperty.all(lightRed)),
            onPressed: () async {
              await AssetsAudioPlayer.newPlayer().open(
                Audio("assets/audio/audioFile.mp3"),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Play', style: TextStyle(fontSize: 30)),
            )),
      ),
    );
  }
}
