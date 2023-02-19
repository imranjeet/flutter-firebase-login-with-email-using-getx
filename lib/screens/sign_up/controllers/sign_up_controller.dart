import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_with_email_app/data/const.dart';
import 'package:login_with_email_app/data/firebase/firebase_auth.dart';
import 'package:login_with_email_app/data/firebase/firebase_functions.dart';
import 'package:login_with_email_app/global_widgets/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final FirebaseFunctions _functions = FirebaseFunctions();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController collegeName = TextEditingController();
  final TextEditingController year = TextEditingController();
  File? imageFile;
  File? pdfFile;
  String filename = "optional";
  final picker = ImagePicker();

  String dropdownvalue = 'Student';
  String yearStr = 'Admission year';

  // Initial Selected Value
  void changeDropdownvalue(String newValue) {
    dropdownvalue = newValue;
    if (newValue == "Alumni" || newValue == "Faculty") {
      yearStr = "Pass-out year";
    }
    update();
  }

  // List of items in our dropdown menu
  var items = [
    'Student',
    'Faculty',
    'Alumni',
  ];

  void getFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      // Rx<File> imageFile = imageFile.obs;
      // imageFile.obs.refresh();
    }
    update();
  }

  void getPDFFromGallery() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null) return;
    if (result != null) {
      pdfFile = File(result.files.single.path!);
      filename = result.files.first.name;
    }
    update();
  }

  void onCreateAccount() async {
    if (imageFile != null) {
      Indicator.showLoading();

      await _authentication
          .createAccount(email.text, password.text)
          .then((value) {
        _functions.createUserCredential(
            imageFile!,
            pdfFile,
            fullName.text,
            email.text,
            phone.text,
            dropdownvalue,
            collegeName.text,
            year.text,
            password.text);
      });
    } else {
      showAlert("Please select your profile pic!");
      log("Please select your profile pic!");
    }
  }
}
