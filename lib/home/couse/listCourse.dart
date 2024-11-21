// ignore_for_file: file_names

import 'package:cadenza/home/couse/videoplayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListcoursePage extends StatefulWidget {
  const ListcoursePage({super.key});

  @override
  State<ListcoursePage> createState() => _ListcoursePageState();
}

class _ListcoursePageState extends State<ListcoursePage> {
  Widget cardCourse(BuildContext context, dynamic docs) {
    return Card(
      child: ListTile(
        title: Text(docs['title']),
        subtitle: Text(docs['subtitle']),
        leading: const Icon(
          Icons.video_settings,
          color: Colors.red,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoplayerPage(
                docs: docs,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff4080FD),
        centerTitle: true,
        title: const Text(
          'Вводный курс',
          style: TextStyle(
            fontFamily: 'Trajan Pro',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('courses')
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return cardCourse(context, snapshot.data!.docs[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
