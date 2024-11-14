// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cadenza/drive/google_drive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WriteInterPage extends StatefulWidget {
  const WriteInterPage({super.key});

  @override
  State<WriteInterPage> createState() => _WriteInterPageState();
}

class _WriteInterPageState extends State<WriteInterPage> {
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

  @override
  void initState() {
    getListAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Терции"),
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
                initState();
              },
              child: const Text("малая терция"),
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
                initState();
              },
              child: const Text("большая терция"),
            ),
          ],
        ),
      ),
    );
  }
}
