import 'package:cadenza/home/pdf_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TheoryPage extends StatefulWidget {
  const TheoryPage({super.key});

  @override
  State<TheoryPage> createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  Widget cardTeo(BuildContext context, dynamic docs) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.school,
          color: Color(0xff4080FD),
        ),
        title: Text(
          docs['title'],
          style: const TextStyle(fontFamily: 'Trajan Pro'),
        ),
        subtitle: Text(
          docs['description'],
          style: const TextStyle(fontFamily: 'Trajan Pro'),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfViewPage(
                doc: docs,
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
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("theories")
                        .orderBy(
                          'id',
                          descending: false,
                        )
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return cardTeo(context, snapshot.data!.docs[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
