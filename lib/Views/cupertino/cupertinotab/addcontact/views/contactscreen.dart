import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/contactmodel.dart';
import '../provider/contactprovider.dart';

class addcontactios extends StatelessWidget {
  addcontactios({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    XFile? image;

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 90),
                CircleAvatar(
                  foregroundImage: (Provider.of<Platform_Provider>(context,
                                  listen: false)
                              .img !=
                          null)
                      ? FileImage(Provider.of<Platform_Provider>(context).img!)
                      : null,
                  radius: 70,
                  child: IconButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      XFile? image =
                          await picker.pickImage(source: ImageSource.camera);
                    },
                    icon: Icon(CupertinoIcons.camera),
                  ),
                ),
                SizedBox(height: 16),
                CupertinoTextField(
                  prefix: Icon(CupertinoIcons.person),
                  controller: nameController,
                  placeholder: "Full Name",
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: CupertinoColors.systemGrey)),
                ),
                SizedBox(height: 16),
                CupertinoTextField(
                  prefix: Icon(CupertinoIcons.phone),
                  controller: numController,
                  placeholder: "Phone Number",
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: CupertinoColors.systemGrey)),
                ),
                SizedBox(height: 16),
                CupertinoTextField(
                  prefix: Icon(CupertinoIcons.chat_bubble_text),
                  controller: chatController,
                  placeholder: "Chat Conversation",
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: CupertinoColors.systemGrey)),
                ),
                SizedBox(height: 70),
                CupertinoButton.filled(
                    child: Text("SAVE"),
                    onPressed: () {
                      Globals.iosDetails.add(
                        iosInformation(
                            name: nameController.text,
                            number: numController.text,
                            chat: chatController.text),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
