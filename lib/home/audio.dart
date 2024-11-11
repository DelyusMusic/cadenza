import 'package:audioplayers/audioplayers.dart';
import 'package:cadenza/drive/google_drive.dart';
import 'package:flutter/material.dart';
import 'package:waved_audio_player/waved_audio_player.dart';
// import 'package:just_audio/just_audio.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  // final player = CacheAudioPlayerPlus();

  GoogleDrive googleDrive = GoogleDrive();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WavedAudioPlayer(
              source: AssetSource('audio/G_D#.mp3'),
              // source: UrlSource(
              //     "${googleDrive.url_drive}197I1oSEIou_0x4QtBLiN5l-4I3nXNkIF"),
            ),
            WavedAudioPlayer(
              source: UrlSource(
                  "${googleDrive.url_drive}197I1oSEIou_0x4QtBLiN5l-4I3nXNkIF"),
            ),
          ],
        ),
      ),
    );
  }
}
