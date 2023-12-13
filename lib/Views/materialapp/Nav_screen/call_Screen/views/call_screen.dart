import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../add _Contact_screen/provider/contactprovider.dart';

class call_screen extends StatelessWidget {
  call_screen({super.key});
  XFile? image;
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
                foregroundImage: FileImage(
                  File("${image?.path}"),
                ),
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
    );
  }
}
