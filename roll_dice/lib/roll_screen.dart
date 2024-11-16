import 'package:flutter/material.dart';
import 'dart:math';

var currentDice = 2;
final randomizer = Random();

class RollScreen extends StatefulWidget {
  const RollScreen({super.key});

  @override
  State<RollScreen> createState() => _RollScreenState();
}

class _RollScreenState extends State<RollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 95, 2, 112),
            Color.fromARGB(215, 187, 21, 216)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/dice-$currentDice.png",
                width: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: onRoll,
                  child: const Text(
                    "Roll dice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ))
            ],
          ))),
    );
  }

  void onRoll() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }
}
