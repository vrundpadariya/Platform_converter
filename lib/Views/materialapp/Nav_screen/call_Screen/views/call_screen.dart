import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../add _Contact_screen/provider/contactprovider.dart';

class call_screen extends StatelessWidget {
  const call_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ContactProvider.allcontact.length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue.withOpacity(.5),
                child: Text(
                  "${ContactProvider.allcontact[i].firstname[0]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text("${ContactProvider.allcontact[i].firstname}"),
              subtitle: Text("${ContactProvider.allcontact[i].number}"),
              trailing: IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse("tel:+91${ContactProvider.allcontact[i].number}"),
                  );
                },
                icon: Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),

      //     : Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               height: 150,
      //               width: 150,
      //               decoration: const BoxDecoration(),
      //             ),
      //             const Text(
      //               "No Contact found",
      //               style: TextStyle(fontSize: 15),
      //             ),
      //           ],
      //         ),
      //       ),
    );
  }
}
