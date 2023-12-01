import 'dart:async';

import 'package:flutter/material.dart';

class Splacescreen extends StatelessWidget {
  const Splacescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'intro');
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("lib/assets/Animation - 1701413363430.gif"),
            ),
          ),
        ),
      ),
    );
  }
}
