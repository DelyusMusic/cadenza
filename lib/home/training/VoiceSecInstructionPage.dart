// ignore_for_file: file_names, must_be_immutable

import 'package:cadenza/home/training/audioTrainigTer.dart';
import 'package:cadenza/home/training/audioTrainingSec.dart';
import 'package:flutter/material.dart';

class Voicesecinstructionpage extends StatelessWidget {
  int? id;
  Voicesecinstructionpage({super.key, this.id});
  final page = [
    const AudiotrainingSecPage(),
    const AudiotrainigTerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Упражнение",
          style: TextStyle(fontFamily: 'Trajan Pro'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Trajan Pro'),
                  "Вам необходимо определить на слух, какой из представленных интервалов был сыгран, нажав на соответствующую кнопку"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Color(0xff4080FD)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => page.elementAt(id!)));
                },
                child: const Text(
                  "К упражнению",
                  style: TextStyle(fontFamily: 'Trajan Pro'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
