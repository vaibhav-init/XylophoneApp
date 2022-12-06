import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const xylophone());
}

class xylophone extends StatefulWidget {
  const xylophone({Key? key}) : super(key: key);

  @override
  State<xylophone> createState() => _xylophoneState();
}

class _xylophoneState extends State<xylophone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Xylophone App'),
          backgroundColor: Colors.white12,
        ),
        body: xyloApp(),
      ),
    );
  }
}

class xyloApp extends StatefulWidget {
  const xyloApp({Key? key}) : super(key: key);

  @override
  State<xyloApp> createState() => _xyloAppState();
}

class _xyloAppState extends State<xyloApp> {
  final player = AudioPlayer();
  void playSound(int number) {
    player.play(
      AssetSource('note$number.wav'),
    );
  }

  Expanded buildApp({int number: 1, Color colour: Colors.red}) {
    return Expanded(
      child: Container(
        color: colour,
        child: TextButton(
          onPressed: () => {playSound(number)},
          child: Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildApp(colour: Colors.red, number: 1),
          buildApp(colour: Colors.orange, number: 2),
          buildApp(colour: Colors.green, number: 3),
          buildApp(colour: Colors.lime, number: 4),
          buildApp(colour: Colors.yellow, number: 5),
          buildApp(colour: Colors.greenAccent, number: 6),
          buildApp(colour: Colors.purple, number: 7),
        ],
      ),
    );
  }
}
