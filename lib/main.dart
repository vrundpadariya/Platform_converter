import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/platform_provider/platform_provider.dart';
import 'package:platform_converter/uitilies/Theme/Theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/cupertino/cupertinotab/addcontact/provider/contactprovider.dart';
import 'Views/cupertino/views/ioshome.dart';
import 'Views/materialapp/Nav_screen/add _Contact_screen/provider/continueprovider.dart';
import 'Views/materialapp/Nav_screen/add _Contact_screen/provider/dateandtimeprovider.dart';
import 'Views/materialapp/model/theme/Thememodel.dart';
import 'Views/materialapp/provider/indexprovider.dart';
import 'Views/materialapp/provider/themeprovider.dart';
import 'Views/materialapp/views/home.dart';
import 'Views/one_time_intro/views/one_time_intro.dart';
import 'Views/splash_screen/views/splace_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isdark = preferences.getBool('isdark') ?? false;
  bool isvisited = preferences.getBool("Isvisited") ?? false;
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
        ListenableProvider(
          create: (ctx) => PlatformProvider(),
        ),
        ListenableProvider(
          create: (ctx) => Platform_Provider(),
        ),
        ListenableProvider(
          create: (ctx) => NavigationProvider(),
        ),
        ListenableProvider(
          create: (ctx) => continueprovider(),
        ),
        ListenableProvider(
          create: (ctx) => DateTimePickerProvider(),
        ),
      ],
      builder: (context, widget) =>
          (Provider.of<PlatformProvider>(context, listen: true)
                      .platform
                      .isIos ==
                  false)
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: apptheme.Light,
                  darkTheme: apptheme.Dark,
                  initialRoute: (isvisited) ? 'home' : '/',
                  routes: {
                    '/': (ctx) => const Splacescreen(),
                    'intro': (ctx) => const introscreen(),
                    'home': (ctx) => home(),
                  },
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  home: Cupertino_Screen(),
                ),
    ),
  );
}
