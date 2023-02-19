import 'package:login_with_email_app/data/firebase/firebase_auth.dart';
import 'package:login_with_email_app/data/firebase/firebase_functions.dart';
import 'package:login_with_email_app/global_widgets/indicator.dart';
import 'package:login_with_email_app/models/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final ScrollController controller = ScrollController();
  var user;
  List favouriteList = [];
  var isLoading = false.obs;

  void getData() async {
    user = await _functions.getCurrentUser();
    Indicator.closeLoading();
    update();
  }

  void logOut() async {
    await _authentication.logOut();
  }

  @override
  void onReady() {
    super.onReady();
    Indicator.showLoading();
  }

  

  @override
  void onInit() {
    super.onInit();
    getData();
   
    _functions.isLoading.listen((p) {
      isLoading.value = p;
    });
    controller.addListener(() {
      double maxScrollPoint = controller.position.maxScrollExtent;
      double currentPosition = controller.position.pixels;
      double height20 = Get.size.height * 0.20;

      if (maxScrollPoint - currentPosition <= height20) {
        getData();
      }
    });
  }
}
