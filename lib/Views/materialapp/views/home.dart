import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../platform_provider/platform_provider.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_call), label: "Add_Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        onTap: (val) {},
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
      body: const Column(
        children: [],
      ),
    );
  }
}
