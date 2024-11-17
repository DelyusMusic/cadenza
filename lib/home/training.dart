import 'package:cadenza/home/training/ear.dart';
import 'package:cadenza/home/training/ritm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                color: Colors.white,
                child: ListTile(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Тренировка слуха',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Trajan Pro'),
                  ),
                  subtitle: const Text(
                    "Различные упражнения для тренировки музыкального слуха",
                    style: TextStyle(fontFamily: 'Trajan Pro'),
                  ),
                  trailing: Icon(
                    size: MediaQuery.of(context).size.height * 0.07,
                    CupertinoIcons.ear,
                    color: const Color(0xff4080FD),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EarPage(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                color: Colors.white,
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      )),
                  title: const Text(
                    "Тренировка ритма",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Trajan Pro'),
                  ),
                  subtitle: const Text(
                    "Различные упражнения для тренировки ритма",
                    style: TextStyle(
                      fontFamily: 'Trajan Pro',
                    ),
                  ),
                  trailing: Icon(
                    size: MediaQuery.of(context).size.height * 0.07,
                    CupertinoIcons.metronome,
                    color: const Color(0xff4080FD),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RitmPage(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
