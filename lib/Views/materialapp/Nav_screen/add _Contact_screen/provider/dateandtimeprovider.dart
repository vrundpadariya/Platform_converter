import 'package:flutter/material.dart';

import '../model/dateandtime.dart';

class DateTimePickerProvider extends ChangeNotifier {
  datepicker datePicker = datepicker(date: DateTime.now());

  void pickDate({required DateTime datetime}) {
    datePicker.date = datetime;
    notifyListeners();
  }

  timepicker timePicker = timepicker(time: TimeOfDay.now());

  void pickTime({required TimeOfDay pickedtime}) {
    timePicker.time = pickedtime;
    notifyListeners();
  }
}
