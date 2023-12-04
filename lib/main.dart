import 'package:flutter/material.dart';
import 'package:platform_converter/Theme/Theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/materialapp/model/theme/Thememodel.dart';
import 'Views/materialapp/provider/themeprovider.dart';
import 'Views/materialapp/views/home.dart';
import 'Views/one_time_intro/views/one_time_intro.dart';
import 'Views/splash_screen/views/splace_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isdark = preferences.getBool('isdark') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(
            theme: ThemeModel(
              isdark: isdark,
            ),
          ),
        ),
      ],
      builder: (context, widget) => MaterialApp(
        theme: apptheme.Light,
        darkTheme: apptheme.Dark,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => const Splacescreen(),
          'intro': (ctx) => const introscreen(),
          'h': (ctx) => const home(),
        },
      ),
    ),
  );

  // CupertinoApp(
  //   debugShowCheckedModeBanner: false,
  //   routes: {},
  //),
}
