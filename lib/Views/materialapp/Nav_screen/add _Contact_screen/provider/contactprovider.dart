import 'package:flutter/material.dart';

import '../model/contactmodel.dart';

class ContactProvider extends ChangeNotifier {
  static List<Contact> allcontact = [];

  void add_contact({required Contact contact}) {
    allcontact.add(contact);
    notifyListeners();
  }

  void remove_contact({required Contact contact}) {
    allcontact.remove(contact);
    notifyListeners();
  }
}
