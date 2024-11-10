import 'package:cadenza/home/course.dart';
import 'package:cadenza/home/profile.dart';
import 'package:cadenza/home/theory.dart';
import 'package:cadenza/home/training.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Курсы";
  int index = 0;
  final screens = [
    const CoursePage(),
    const TheoryPage(),
    const TrainingPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 3
          ? null
          : AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
      body: screens.elementAt(index),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FloatingNavbar(
            backgroundColor: Colors.blue,
            borderRadius: 20,
            selectedItemColor: Colors.yellow,
            selectedBackgroundColor: Colors.blue,
            items: [
              FloatingNavbarItem(icon: Icons.school, title: 'Курсы'),
              FloatingNavbarItem(icon: Icons.book, title: 'Теория'),
              FloatingNavbarItem(icon: Icons.mic, title: 'Тренниг'),
              FloatingNavbarItem(icon: Icons.person, title: 'Профиль'),
            ],
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
                if (index == 0) {
                  title = "Курсы";
                }
                if (index == 1) {
                  title = "Теория";
                }
                if (index == 2) {
                  title = "Тренинг";
                }
                if (index == 3) {
                  title = "Профиль";
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
