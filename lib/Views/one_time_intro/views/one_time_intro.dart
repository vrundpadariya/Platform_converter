import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

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
          // SharedPreferences preferences =
          // await SharedPreferences.getInstance();
          // preferences.setBool("Isvisited", true);
        },
        done: Text("Done"),
        showNextButton: true,
        next: Text("Next"),
      ),
    );
  }
}
