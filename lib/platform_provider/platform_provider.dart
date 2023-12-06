import 'package:flutter/cupertino.dart';

import '../uitilies/modeul/platform.dart';

class PlatformProvider extends ChangeNotifier {
  Platform platform = Platform(isIos: false);

  void changePlatform() {
    platform.isIos = !platform.isIos;
    notifyListeners();
  }
}
