import 'package:cadenza/home/audio.dart';
import 'package:flutter/material.dart';

class AudiotrainingSecPage extends StatefulWidget {
  const AudiotrainingSecPage({super.key});

  @override
  State<AudiotrainingSecPage> createState() => _AudiotrainingSecPageState();
}

class _AudiotrainingSecPageState extends State<AudiotrainingSecPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Унисон и секунда"),
        centerTitle: true,
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(""),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          AudioPage(
            urlAudio: "",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Color(0xff4080FD))),
                onPressed: () {},
                child: const Text("унисон"),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Color(0xff4080FD))),
                onPressed: () {},
                child: const Text("малая секунда"),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ElevatedButton(
            style: const ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Color(0xff4080FD))),
            onPressed: () {},
            child: const Text("Большая секунда"),
          ),
        ],
      ),
    );
  }
}
