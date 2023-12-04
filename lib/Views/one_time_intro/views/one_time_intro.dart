import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class introscreen extends StatelessWidget {
  const introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            //useScrollView: true,
            title: "Add Contact",
            body:
                "\nAdd your friend and family \n with you by this App and talk with them",
            image: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "lib/assets/Animation - 1701414269096.gif",
                  ),
                ),
              ),
            ),
          ),
          PageViewModel(
            title: "SMS",
            body:
                "\nAdd your friend and family \n with you by this App \n do SMS and chat with them",
            image: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "lib/assets/Animation - 1701671783641.gif",
                  ),
                ),
              ),
            ),
          ),
          PageViewModel(
            title: "Email",
            body:
                "Do your personal email or Bussiness email\n For this app anytime",
            image: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "lib/assets/Animation - 1701671583001.gif",
                  ),
                ),
              ),
            ),
          ),
          PageViewModel(
            title: "Add Contact",
            body: "\nAdd your friend and family \n with you by this App",
            image: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "lib/assets/Animation - 1701414269096.gif",
                  ),
                ),
              ),
            ),
          ),
        ],
        onDone: () async {
          Navigator.pushReplacementNamed(context, 'h');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("Isvisited", true);
        },
        done: Text("Done"),
        showNextButton: true,
        next: Text("Next"),
      ),
    );
  }
}
