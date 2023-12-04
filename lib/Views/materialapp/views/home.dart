import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/themeprovider.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "contact app",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: true).changeTheme();
            },
            icon: Icon(
              Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
