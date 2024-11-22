// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cadenza/drive/google_drive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waved_audio_player/waved_audio_player.dart';

class AudiotrainingSecPage extends StatefulWidget {
  const AudiotrainingSecPage({super.key});

  @override
  State<AudiotrainingSecPage> createState() => _AudiotrainingSecPageState();
}

class _AudiotrainingSecPageState extends State<AudiotrainingSecPage> {
  dynamic docs;
  GoogleDrive googleDrive = GoogleDrive();

  final colorsBtn = [
    const Color(0xff4080FD),
    Colors.green,
    Colors.red,
  ];

  Color btn1 = const Color(0xff4080FD);
  Color btn2 = const Color(0xff4080FD);
  Color btn3 = const Color(0xff4080FD);

  getListAudio() async {
    var random = Random().nextInt(10);
    var items =
        await FirebaseFirestore.instance.collection('trainings_sec').get();

    setState(() {
      docs = items.docs.elementAt(random);
      btn1 = const Color(0xff4080FD);
      btn2 = const Color(0xff4080FD);
      btn3 = const Color(0xff4080FD);
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
        title: const Text("Унисон и секунда",style: TextStyle(fontFamily: 'Trajan Pro'),),
        centerTitle: true,
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(googleDrive.url_drive+docs['image']),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          audioPlay(context, url!),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                 style: ButtonStyle(
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(btn1)),
                onPressed: () async {
                  if (docs['result'] == 1) {
                    setState(() {
                      btn1 = colorsBtn.elementAt(1);
                      btn2 = colorsBtn.elementAt(2);
                      btn3 = colorsBtn.elementAt(2);
                    });
                  }
                  if (docs['result'] == 2) {
                    setState(() {
                      btn1 = colorsBtn.elementAt(2);
                      btn2 = colorsBtn.elementAt(1);
                      btn3 = colorsBtn.elementAt(2);
                    });
                  }
                  if (docs['result'] == 3) {
                    setState(() {
                      btn1 = colorsBtn.elementAt(2);
                      btn2 = colorsBtn.elementAt(2);
                      btn3 = colorsBtn.elementAt(1);
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
                      builder: (context) => const AudiotrainingSecPage(),
                    ),
                  );
                },
                child: const Text("унисон",style: TextStyle(fontFamily: 'Trajan Pro'),),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(btn2)),
                onPressed: () async {
                  if (docs['result'] == 1) {
                    setState(() {
                      btn1 = colorsBtn.elementAt(1);
                      btn2 = colorsBtn.elementAt(2);
                      btn3 = colorsBtn.elementAt(2);
                    });
                  }
                  if (docs['result'] == 2) {
                    setState(() {
                      btn1 = colorsBtn.elementAt(2);
                      btn2 = colorsBtn.elementAt(1);
                      btn3 = colorsBtn.elementAt(2);
                    });
                  }
                  if (docs['result'] == 3) {
                    setState(() {
                      btn1 = colorsBtn.elementAt(2);
                      btn2 = colorsBtn.elementAt(2);
                      btn3 = colorsBtn.elementAt(1);
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
                      builder: (context) => const AudiotrainingSecPage(),
                    ),
                  );
                },
                child: const Text("малая секунда",style: TextStyle(fontFamily: 'Trajan Pro'),),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ElevatedButton(
             style: ButtonStyle(
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(btn3)),
            onPressed: () async {
              if (docs['result'] == 1) {
                setState(() {
                  btn1 = colorsBtn.elementAt(1);
                  btn2 = colorsBtn.elementAt(2);
                  btn3 = colorsBtn.elementAt(2);
                });
              }
              if (docs['result'] == 2) {
                setState(() {
                  btn1 = colorsBtn.elementAt(2);
                  btn2 = colorsBtn.elementAt(1);
                  btn3 = colorsBtn.elementAt(2);
                });
              }
              if (docs['result'] == 3) {
                setState(() {
                  btn1 = colorsBtn.elementAt(2);
                  btn2 = colorsBtn.elementAt(2);
                  btn3 = colorsBtn.elementAt(1);
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
                  builder: (context) => const AudiotrainingSecPage(),
                ),
              );
            },
            child: const Text("большая секунда",style: TextStyle(fontFamily: 'Trajan Pro'),),
          ),
        ],
      ),
    );
  }
}
