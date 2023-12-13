import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../addcontact/provider/contactprovider.dart';

class settingios extends StatelessWidget {
  const settingios({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.home),
          middle: Text("Platform Convertor"),
          trailing: CupertinoSwitch(
            onChanged: (val) {
              Provider.of<Platform_Provider>(context, listen: false)
                  .changeSwitch(val);
            },
            value: Provider.of<Platform_Provider>(context, listen: false).switc,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            CupertinoListTile(
              title: Text("Profile"),
              subtitle: Text("Update Profile Data"),
              leading: Icon(CupertinoIcons.person),
              trailing: CupertinoSwitch(
                value: Provider.of<Platform_Provider>(context).iosprofile,
                onChanged: (val) {
                  Provider.of<Platform_Provider>(context, listen: false)
                      .iosProfile(val);
                },
              ),
            ),
            SizedBox(height: 16),
            CupertinoListTile(
              title: Text("Theme"),
              subtitle: Text("Change Theme"),
              leading: Icon(CupertinoIcons.sun_min),
              trailing: CupertinoSwitch(
                value: Provider.of<Platform_Provider>(context).theme,
                onChanged: (val) {
                  Provider.of<Platform_Provider>(context, listen: false)
                      .Theme(val);
                },
              ),
            )
          ],
        ));
  }
}
