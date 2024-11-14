// ignore_for_file: file_names

import 'package:cadenza/home/training/writeInterSec.dart';
import 'package:cadenza/home/training/write_inter.dart';
import 'package:flutter/material.dart';

class SelectwritePage extends StatelessWidget {
  const SelectwritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Сравнение интервалов",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Унисон и секунда"),
            leading: const Icon(
              Icons.school,
              color: Color(0xff4080FD),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteintersecPage (),));
            },
          ),
          ListTile(
            title: const Text("Терции"),
            leading: const Icon(
              Icons.school,
              color: Color(0xff4080FD),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteInterPage(),));
            },
          ),
        ],
      ),
    );
  }
}