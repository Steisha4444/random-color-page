import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const RandomColorText(),
    );
  }
}

class RandomColorText extends StatefulWidget {
  const RandomColorText({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomColorText> createState() => _RandomColorTextState();
}

class _RandomColorTextState extends State<RandomColorText> {
  Color gerRandomColor() {
    Random random = Random();

    return Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
  }

  late Color color = gerRandomColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          color = gerRandomColor();
          setState(() {});
        },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                color: color,
              ),
              child: const Center(
                child: Text(
                  'Hey there',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
