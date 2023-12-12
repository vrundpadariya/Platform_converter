import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/continuemodel.dart';
import '../provider/continueprovider.dart';

class Contactscreen extends StatelessWidget {
  const Contactscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Continue c = Continue(currentsteps: 0);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create contact",
                ),
                const SizedBox(
                  width: 220,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.save),
                ),
              ],
            ),
            Stepper(
              currentStep:
                  Provider.of<continueprovider>(context).c.currentsteps,
              onStepContinue: () {
                Provider.of<continueprovider>(context, listen: false)
                    .Continuestep();
              },
              onStepCancel: () {
                Provider.of<continueprovider>(context, listen: false)
                    .cancelstep();
              },
              steps: [
                Step(
                  state:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              0)
                          ? StepState.editing
                          : StepState.indexed,
                  isActive:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              0)
                          ? true
                          : false,
                  title: const Text(
                    "Photo",
                  ),
                  content: const CircleAvatar(
                    radius: 90.5,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 90,
                    ),
                  ),
                ),
                Step(
                  state:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              1)
                          ? StepState.editing
                          : StepState.indexed,
                  isActive:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              1)
                          ? true
                          : false,
                  title: const Text(
                    "Enter Detail",
                  ),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "First name",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Last name ",
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                  state:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              2)
                          ? StepState.editing
                          : StepState.indexed,
                  isActive:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              2)
                          ? true
                          : false,
                  title: const Text(
                    "contact information",
                  ),
                  content: Column(
                    children: [
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(hintText: "phone number"),
                      ),
                    ],
                  ),
                ),
                Step(
                  state:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              3)
                          ? StepState.editing
                          : StepState.indexed,
                  isActive:
                      (Provider.of<continueprovider>(context).c.currentsteps ==
                              3)
                          ? true
                          : false,
                  title: const Text(
                    "Email",
                  ),
                  content: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
