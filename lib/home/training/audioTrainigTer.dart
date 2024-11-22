// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cadenza/drive/google_drive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waved_audio_player/waved_audio_player.dart';

class AudiotrainigTerPage extends StatefulWidget {
  const AudiotrainigTerPage({super.key});

  @override
  State<AudiotrainigTerPage> createState() => _AudiotrainigTerPageState();
}

class _AudiotrainigTerPageState extends State<AudiotrainigTerPage> {
  dynamic docs;
  GoogleDrive googleDrive = GoogleDrive();

  final colorsBtn = [
    const Color(0xff4080FD),
    Colors.green,
    Colors.red,
  ];

  Color btn1 = const Color(0xff4080FD);
  Color btn2 = const Color(0xff4080FD);

  getListAudio() async {
    var random = Random().nextInt(7);
    var items = await FirebaseFirestore.instance.collection('trainings').get();

    setState(() {
      docs = items.docs.elementAt(random);
      btn1 = const Color(0xff4080FD);
      btn2 = const Color(0xff4080FD);
    });
  }

  Widget audioPlay(BuildContext context, String url) {
    return WavedAudioPlayer(
      source: UrlSource(
        googleDrive.url_drive + url,
      ),
    );
  }

  @override
  void initState() {
    getListAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? url;
    setState(() {
      url = docs['audio'];
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Терции",
          style: TextStyle(fontFamily: 'Trajan Pro'),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              googleDrive.url_drive + docs['image'],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            audioPlay(context, url!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(btn1)),
              onPressed: () async {
                if (docs['result'] == 1) {
                  setState(() {
                    btn1 = colorsBtn.elementAt(1);
                    btn2 = colorsBtn.elementAt(2);
                  });
                }
                if (docs['result'] == 2) {
                  setState(() {
                    btn1 = colorsBtn.elementAt(2);
                    btn2 = colorsBtn.elementAt(1);
                  });
                }
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff4080FD),
                    ),
                  ),
                );
                await Future.delayed(
                  const Duration(seconds: 2),
                );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AudiotrainigTerPage(),
                  ),
                );
              },
              child: const Text(
                "малая терция",
                style: TextStyle(fontFamily: 'Trajan Pro'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(btn2)),
              onPressed: () async {
                if (docs['result'] == 2) {
                  setState(() {
                    btn2 = colorsBtn.elementAt(1);
                    btn1 = colorsBtn.elementAt(2);
                  });
                }
                if (docs['result'] == 1) {
                  setState(() {
                    btn2 = colorsBtn.elementAt(2);
                    btn1 = colorsBtn.elementAt(1);
                  });
                }
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff4080FD),
                    ),
                  ),
                );
                await Future.delayed(
                  const Duration(seconds: 2),
                );
                Navigator.pop(context);
                // initState();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AudiotrainigTerPage(),
                  ),
                );
              },
              child: const Text(
                "большая терция",
                style: TextStyle(fontFamily: 'Trajan Pro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
