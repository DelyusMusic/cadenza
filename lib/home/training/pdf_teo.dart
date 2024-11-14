// ignore_for_file: must_be_immutable

import 'package:cadenza/drive/google_drive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfTeoPage extends StatefulWidget {
  String? url;
  PdfTeoPage({super.key, this.url});

  @override
  State<PdfTeoPage> createState() => _PdfTeoPageState();
}

class _PdfTeoPageState extends State<PdfTeoPage> {
  GoogleDrive googleDrive = GoogleDrive();
  bool night = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Теория"),
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
          googleDrive.url_drive + widget.url!,
        ),
      ),
    );
  }
}
