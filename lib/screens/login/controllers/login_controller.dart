import 'package:login_with_email_app/data/const.dart';
import 'package:login_with_email_app/data/firebase/firebase_auth.dart';
import 'package:login_with_email_app/global_widgets/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_with_email_app/routes/app_pages.dart';

bool validateEmail(String value) {
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return (!regex.hasMatch(value)) ? false : true;
}

class LoginController extends GetxController {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void onLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authentication.login(email.text, password.text);
    } else {
      showAlert("All fields are required");
    }
  }
}
