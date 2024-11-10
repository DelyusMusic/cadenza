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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doc['description']),
      ),
      body: Container(
        child: const PDF().fromUrl(
          googleDrive.url_drive + widget.doc['file'],
        ),
      ),
    );
  }
}
