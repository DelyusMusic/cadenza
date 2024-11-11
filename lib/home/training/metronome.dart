import 'package:flutter/material.dart';
import 'package:metronome/metronome.dart';

class MetronomePage extends StatefulWidget {
  const MetronomePage({super.key});

  @override
  State<MetronomePage> createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomePage> {
  final metronome = Metronome();
  int bpm = 120;
  int vol = 50;
  bool isplaying = false;
  String metronomeIcon = "images/metronomeRight.jpg";
  @override
  void initState() {
    metronome.init(
      'path',
      bpm: bpm,
      volume: vol,
    );
    super.initState();
  }

  @override
  void dispose() {
    metronome.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Метроном"),
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(
              metronomeIcon,
              height: MediaQuery.of(context).size.height * 0.3,
              gaplessPlayback: true,
            ),
            Text(
              'BPM:$bpm',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              thumbColor: const Color(0xff4080FD),
              activeColor: const Color(0xff4080FD),
              value: bpm.toDouble(),
              min: 30,
              max: 300,
              divisions: 270,
              onChangeEnd: (val) {
                metronome.setBPM(bpm);
              },
              onChanged: (val) {
                bpm = val.toInt();
                setState(() {});
              },
            ),
            Text(
              'Volume:$vol%',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              thumbColor: const Color(0xff4080FD),
              activeColor: const Color(0xff4080FD),
              value: vol.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              onChangeEnd: (val) {
                metronome.setVolume(vol);
              },
              onChanged: (val) {
                vol = val.toInt();
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4080FD),
        foregroundColor: Colors.white,
        onPressed: () async {
          if (isplaying) {
            metronome.pause();
            isplaying = false;
          } else {
            metronome.setVolume(vol);
            metronome.play(bpm);
            isplaying = true;
          }
          // int? bpm2 = await _metronomePlugin.getBPM();
          // print(bpm2);
          // int? vol2 = await _metronomePlugin.getVolume();
          // print(vol2);
          setState(() {});
        },
        child: Icon(isplaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
