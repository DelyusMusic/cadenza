// ignore_for_file: must_be_immutable, file_names

import 'package:cadenza/home/training/writeInterSec.dart';
import 'package:cadenza/home/training/write_inter.dart';
import 'package:flutter/material.dart';

class WritesecinstructionPage extends StatelessWidget {
  int? id;
  WritesecinstructionPage({super.key, this.id});

  final page = [
    const WriteintersecPage(),
    const WriteInterPage(),
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
                  "В этом упражнении Вам необходимо определить по на картинке, какой из представленных интервалов был сыгран, нажав на соответствующую кнопку"),
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
                child: const Text("К упражнению",style: TextStyle(fontFamily: 'Trajan Pro'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
