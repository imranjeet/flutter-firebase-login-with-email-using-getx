import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_with_email_app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void isLoggedIn() {
    if (_auth.currentUser != null) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    isLoggedIn();
  }
}
