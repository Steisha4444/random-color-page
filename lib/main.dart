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
      home: const RandomColorPage(),
    );
  }
}

class RandomColorPage extends StatefulWidget {
  const RandomColorPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomColorPage> createState() => _RandomColorPageState();
}

class _RandomColorPageState extends State<RandomColorPage> {
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
