import 'package:flutter/cupertino.dart';

import '../cupertinotab/call/views/call.dart';
import '../cupertinotab/setting/views/setting.dart';

class Cupertino_Screen extends StatelessWidget {
  Cupertino_Screen({super.key});
  List<Widget> pages = [callios(), settingios()];
  //addcontactios()
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), label: "Call"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet_below_rectangle),
                label: "Slivers"),
          ],
        ),
        tabBuilder: (ctx, i) {
          return CupertinoTabView(builder: (ctx) => pages[i]);
        });
  }
}
