import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../platform_provider/platform_provider.dart';

class iosscreen extends StatelessWidget {
  const iosscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoSwitch(
          value: Provider.of<PlatformProvider>(context, listen: true)
              .platform
              .isIos,
          onChanged: (val) {
            Provider.of<PlatformProvider>(context, listen: false)
                .changePlatform();
          },
        ),
      ),
      child: Center(
        child: CupertinoContextMenu(
          actions: [
            CupertinoContextMenuAction(
              onPressed: () {},
              child: Icon(CupertinoIcons.add),
            ),
            CupertinoContextMenuAction(
              onPressed: () {},
              child: Icon(CupertinoIcons.add),
            ),
          ],
          child: const CircleAvatar(
            radius: 89,
            backgroundImage: NetworkImage(
                "https://images.ctfassets.net/usf1vwtuqyxm/7LdBbmsnpgs6mCHpRrnGal/df819e7c91f65eef31fdb7e3f87d1424/unicorn_2_1800x1248.png?h=416&w=600&fit=pad"),
          ),
        ),
      ),
    );
  }
}
