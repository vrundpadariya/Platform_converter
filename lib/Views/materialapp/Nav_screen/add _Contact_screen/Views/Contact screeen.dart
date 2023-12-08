import 'package:flutter/material.dart';

class Contactscreen extends StatelessWidget {
  const Contactscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Create contact",
            ),
            Stepper(
              currentStep: 0,
              onStepContinue: () {},
              onStepCancel: () {},
              steps: const [
                Step(
                  title: Text(
                    "Photo",
                  ),
                  content: CircleAvatar(
                    radius: 90.5,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 90,
                    ),
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
