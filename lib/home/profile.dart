// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cadenza/database/service.dart';
import 'package:cadenza/drive/google_drive.dart';
import 'package:cadenza/home/new_pass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GoogleDrive googleDrive = GoogleDrive();
  dynamic docsUser;
  AuthService authService = AuthService();
  final userId = FirebaseAuth.instance.currentUser!.uid.toString();

  getUser() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    setState(() {
      docsUser = documentSnapshot;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "images/screen.png",
        width: MediaQuery.of(context).size.width * 1,
        fit: BoxFit.fill,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await authService.logOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                const Text(
                  "Профиль",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        googleDrive.url_drive + docsUser['image'],
                        // docsUser['image'],
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "e-mail:" + docsUser['email'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'name:' + docsUser['name'],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: const Text(
                        "Сменить пароль",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPassPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
