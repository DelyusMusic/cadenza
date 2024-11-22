import 'package:cadenza/home/training/selectTraining.dart';
import 'package:cadenza/home/training/selectWrite.dart';
import 'package:flutter/material.dart';
import 'pdf_teo.dart';

class EarPage extends StatelessWidget {
  const EarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Тренировка слуха",
          style: TextStyle(fontFamily: 'Trajan Pro'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Column(
            children: [
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
                    ///// Передать док
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfTeoPage(
                          url: "1gSu6S4L5BIYW-KvtyzvKUutPbRvbCXPf",
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.book,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                "Теория",
                style: TextStyle(fontFamily: 'Trajan Pro'),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelecttrainingPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text(
                    "Определение интервалов",
                    style: TextStyle(fontFamily: 'Trajan Pro'),
                  )
                ],
              ),
              Column(
                children: [
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectwritePage()));
                      },
                      child: const Icon(
                        Icons.notes,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text(
                    "Чтение интервалов",
                    style: TextStyle(fontFamily: 'Trajan Pro'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
