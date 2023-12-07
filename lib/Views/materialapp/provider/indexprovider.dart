import 'package:flutter/cupertino.dart';
import 'package:platform_converter/Views/materialapp/model/index_model/index.dart';

class NavigationProvider extends ChangeNotifier {
  navigationbarindex navigationindex = navigationbarindex(selectindex: 0);
  PageController pageController = PageController();

  void changeNavigationBarIndex({required int index}) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    navigationindex.selectindex = index;
    notifyListeners();
  }
}
