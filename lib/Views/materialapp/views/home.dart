import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../platform_provider/platform_provider.dart';
import '../Nav_screen/Settings_screen/views/setting_dart.dart';
import '../Nav_screen/add _Contact_screen/Views/Contact screeen.dart';
import '../Nav_screen/call_Screen/views/call_screen.dart';
import '../provider/indexprovider.dart';

class home extends StatelessWidget {
  home({super.key});
  List<Widget> pages = [
    const Contactscreen(),
    const call_screen(),
    const settingscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_call), label: "Add_Contact"),
          // BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        currentIndex: Provider.of<NavigationProvider>(context)
            .navigationindex
            .selectindex,
        onTap: (val) {
          Provider.of<NavigationProvider>(context).pageController;
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "contact app",
        ),
        actions: [
          const Text("Platform converter"),
          Switch(
              value: Provider.of<PlatformProvider>(context, listen: true)
                  .platform
                  .isIos,
              onChanged: (val) {
                Provider.of<PlatformProvider>(context, listen: false)
                    .changePlatform();
              })
        ],
      ),
      body: PageView(
        onPageChanged: (val) {
          Provider.of<NavigationProvider>(context, listen: false)
              .changeNavigationBarIndex(index: val);
        },
        controller: Provider.of<NavigationProvider>(context, listen: true)
            .pageController,
        children: pages,
      ),
    );
  }
}
