// ignore_for_file: must_be_immutable

import 'package:cadenza/drive/google_drive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewPage extends StatefulWidget {
  dynamic doc;
  PdfViewPage({super.key, this.doc});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  GoogleDrive googleDrive = GoogleDrive();
  bool night = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.doc['description'],
          style: const TextStyle(fontFamily: 'Trajan Pro'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                night = !night;
              });
            },
            icon: Icon(
              night
                  ? Icons.brightness_medium
                  : Icons.brightness_medium_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        child: PDF(
          nightMode: night,
        ).fromUrl(
          googleDrive.url_drive + widget.doc['file'],
        ),
      ),
    );
  }
}
