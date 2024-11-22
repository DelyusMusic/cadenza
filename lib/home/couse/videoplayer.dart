// ignore_for_file: must_be_immutable

import 'package:cadenza/drive/google_drive.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoplayerPage extends StatefulWidget {
  dynamic docs;
  VideoplayerPage({super.key, this.docs});

  @override
  State<VideoplayerPage> createState() => _VideoplayerPageState();
}

class _VideoplayerPageState extends State<VideoplayerPage> {
  GoogleDrive googleDrive = GoogleDrive();
  late FlickManager flickManager;
  @override
  void initState() {
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(googleDrive.url_drive + widget.docs['video']),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4080FD),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.docs['subtitle'],
          style: const TextStyle(color: Colors.white, fontFamily: 'Trajan Pro'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FlickVideoPlayer(
                flickManager: flickManager,
                wakelockEnabled: true,
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickPortraitControls(
                    progressBarSettings: FlickProgressBarSettings(
                      backgroundColor: Colors.blue,
                      bufferedColor: Colors.blue,
                      playedColor: Colors.blue,
                      handleColor: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    const Text(
                      "Краткое описание",
                      style: TextStyle(
                        fontFamily: 'Trajan Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      alignment: Alignment.center,
                      child: Text(
                        widget.docs['description'],
                        style: const TextStyle(fontFamily: 'Trajan Pro'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
