// ignore_for_file: file_names

import 'package:cadenza/home/training/writesecInstruction.dart';
import 'package:flutter/material.dart';

class SelectwritePage extends StatelessWidget {
  const SelectwritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Чтение интервалов",
          style: TextStyle(color: Colors.white,fontFamily: 'Trajan Pro'),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Унисон и секунда",style: TextStyle(fontFamily: 'Trajan Pro'),),
            leading: const Icon(
              Icons.school,
              color: Color(0xff4080FD),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  WritesecinstructionPage (id: 0,),));
            },
          ),
          ListTile(
            title: const Text("Терции",style: TextStyle(fontFamily: 'Trajan Pro'),),
            leading: const Icon(
              Icons.school,
              color: Color(0xff4080FD),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  WritesecinstructionPage(id: 1,),));
            },
          ),
        ],
      ),
    );
  }
}