// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../platform_provider/platform_provider.dart';
//
// class addcontactios extends StatelessWidget {
//   const addcontactios({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     XFile? image;
//
//     GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         trailing: CupertinoSwitch(
//           value: Provider.of<PlatformProvider>(context, listen: true)
//               .platform
//               .isIos,
//           onChanged: (val) {
//             Provider.of<PlatformProvider>(context, listen: false)
//                 .changePlatform();
//           },
//         ),
//       ),
//       child: CupertinoStepper(
//         currentStep: Provider.of<ContinueProvider>(context).c.currentsteps,
//         onStepContinue: () {
//           Provider.of<ContinueProvider>(context, listen: false).continuestep();
//         },
//         onStepCancel: () {
//           Provider.of<ContinueProvider>(context, listen: false).cancelstep();
//         },
//         steps: [
//           // Your Step widgets here
//           // ...
//         ],
//       ),
//     );
//   }
// }
