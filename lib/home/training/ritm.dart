import 'package:cadenza/home/audio.dart';
import 'package:cadenza/home/training/metronome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RitmPage extends StatelessWidget {
  const RitmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
        title: const Text("Тренировка ритма"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.22,
              child: FloatingActionButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                backgroundColor: const Color(0xff4080FD),
                onPressed: () {},
                child: Icon(
                  size: MediaQuery.of(context).size.height * 0.05,
                  Icons.book,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text("Теория"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.22,
              child: FloatingActionButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                backgroundColor: const Color(0xff4080FD),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MetronomePage()));
                },
                child: Icon(
                  size: MediaQuery.of(context).size.height * 0.05,
                  CupertinoIcons.metronome,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text("Метроном"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AudioPage(),
          ),
        );
      }),
    );
  }
}
