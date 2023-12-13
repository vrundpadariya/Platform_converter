import 'package:flutter/cupertino.dart';
import 'package:platform_converter/Views/materialapp/Nav_screen/add%20_Contact_screen/model/continuemodel.dart';

class continueprovider extends ChangeNotifier {
  Continue c = Continue(currentsteps: 0);
  void Continuestep() {
    if (c.currentsteps != 4) {
      c.currentsteps++;
    }

    notifyListeners();
  }

  void cancelstep() {
    if (c.currentsteps != 0) {
      c.currentsteps--;
    }

    notifyListeners();
  }
}
