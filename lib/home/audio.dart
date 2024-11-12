// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:cadenza/drive/google_drive.dart';
import 'package:flutter/material.dart';
import 'package:waved_audio_player/waved_audio_player.dart';

class AudioPage extends StatefulWidget {
  String? urlAudio;
  AudioPage({super.key, this.urlAudio});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  GoogleDrive googleDrive = GoogleDrive();
  @override
  Widget build(BuildContext context) {
    return WavedAudioPlayer(
      // source: UrlSource(
      //   googleDrive.url_drive + widget.urlAudio!,
      // ),
      source: UrlSource(
          googleDrive.url_drive + widget.urlAudio!),
    );
  }
}
