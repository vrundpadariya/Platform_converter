import 'package:flutter/material.dart';

import 'Views/materialapp/views/home.dart';
import 'Views/one_time_intro/views/one_time_intro.dart';
import 'Views/splash_screen/views/splace_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const Splacescreen(),
        'intro': (ctx) => const introscreen(),
        'h': (ctx) => const home(),
      },
    ),
    // CupertinoApp(
    //   debugShowCheckedModeBanner: false,
    //   routes: {},
    //),
  );
}
