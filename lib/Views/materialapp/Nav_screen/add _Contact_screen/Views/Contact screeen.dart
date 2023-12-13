import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/Global.dart';
import '../model/contactmodel.dart';
import '../model/continuemodel.dart';
import '../provider/contactprovider.dart';
import '../provider/continueprovider.dart';
import '../provider/dateandtimeprovider.dart';

class contact extends StatefulWidget {
  contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  XFile? image;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TimeOfDay time = Provider.of<DateTimePickerProvider>(context, listen: true)
        .timePicker
        .time;
    DateTime date = Provider.of<DateTimePickerProvider>(context, listen: true)
        .datePicker
        .date;
    Continue c = Continue(currentsteps: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add contact ",
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Contact contact_data = Contact(
                  firstname: Global.firstname!,
                  lastname: Global.lastname!,
                  number: Global.number!,
                  email: Global.email!,
                );

                Provider.of<ContactProvider>(context, listen: false)
                    .add_contact(contact: contact_data);
                Navigator.pushNamed(context, 'home');
              }
              Global.firstEditingController.clear();
              Global.lastEditingController.clear();
              Global.emailEditingController.clear();
              Global.numberEditingController.clear();
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Stepper(
        currentStep: Provider.of<continueprovider>(context).c.currentsteps,
        onStepContinue: () {
          Provider.of<continueprovider>(context, listen: false).Continuestep();
        },
        onStepCancel: () {
          Provider.of<continueprovider>(context, listen: false).cancelstep();
        },
        steps: [
          Step(
            state: (Provider.of<continueprovider>(context).c.currentsteps == 0)
                ? StepState.editing
                : StepState.indexed,
            isActive:
                (Provider.of<continueprovider>(context).c.currentsteps == 0)
                    ? true
                    : false,
            title: Text(
              "ADD Photo",
            ),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 90,
                  foregroundImage: FileImage(
                    File(
                      "${image?.path}",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        image = await Global.picker.pickImage(
                          source: ImageSource.camera,
                        );
                        setState(() {
                          Global.imagePath = image!.path;
                        });
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        image = await Global.picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {
                          Global.imagePath = image!.path;
                        });
                      },
                      icon: const Icon(
                        Icons.panorama,
                        size: 35,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Step(
            state: (Provider.of<continueprovider>(context).c.currentsteps == 1)
                ? StepState.editing
                : StepState.indexed,
            isActive:
                (Provider.of<continueprovider>(context).c.currentsteps == 1)
                    ? true
                    : false,
            title: const Text("NAME"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter First Name ",
                    hintStyle: TextStyle(),
                  ),
                  controller: Global.firstEditingController,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter  Second Name ",
                    hintStyle: TextStyle(),
                  ),
                  controller: Global.lastEditingController,
                ),
              ],
            ),
          ),
          Step(
            state: (Provider.of<continueprovider>(context).c.currentsteps == 2)
                ? StepState.editing
                : StepState.indexed,
            isActive:
                (Provider.of<continueprovider>(context).c.currentsteps == 2)
                    ? true
                    : false,
            title: const Text("Phone Number"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: Global.numberEditingController,
                ),
              ],
            ),
          ),
          Step(
            state: (Provider.of<continueprovider>(context).c.currentsteps == 3)
                ? StepState.editing
                : StepState.indexed,
            isActive:
                (Provider.of<continueprovider>(context).c.currentsteps == 3)
                    ? true
                    : false,
            title: const Text("Email"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: Global.emailEditingController,
                ),
              ],
            ),
          ),
          Step(
            state: (Provider.of<continueprovider>(context).c.currentsteps == 4)
                ? StepState.editing
                : StepState.indexed,
            isActive:
                (Provider.of<continueprovider>(context).c.currentsteps == 4)
                    ? true
                    : false,
            title: const Text("Date and time"),
            content: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2050),
                        );

                        Provider.of<DateTimePickerProvider>(context,
                                listen: false)
                            .pickDate(datetime: pickedDate!);
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${date.day}/${date.month}/${date.year}"),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        Provider.of<DateTimePickerProvider>(context,
                                listen: false)
                            .pickTime(pickedtime: time!);
                      },
                      icon: const Icon(
                        Icons.watch_rounded,
                        size: 35,
                      ),
                    ),
                    Text("${time.hour}:${time.minute}"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
