import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static ImagePicker picker = ImagePicker();
  static String? imagePath = "";
  static TextEditingController firstEditingController = TextEditingController();
  static TextEditingController lastEditingController = TextEditingController();
  static TextEditingController numberEditingController =
      TextEditingController();
  static TextEditingController emailEditingController = TextEditingController();

  static String? firstname;
  static String? lastname;
  static String? number;
  static String? email;
}
