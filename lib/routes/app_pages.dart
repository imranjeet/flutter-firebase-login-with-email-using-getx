import 'package:get/get.dart';

import 'package:login_with_email_app/screens/splash_screen/bindings/splash_screen_binding.dart';
import 'package:login_with_email_app/screens/splash_screen/views/splash_screen_view.dart';
import 'package:login_with_email_app/screens/home/bindings/home_binding.dart';
import 'package:login_with_email_app/screens/home/views/home_view.dart';
import 'package:login_with_email_app/screens/login/bindings/login_binding.dart';
import 'package:login_with_email_app/screens/login/views/login_view.dart';

import 'package:login_with_email_app/screens/sign_up/bindings/sign_up_binding.dart';
import 'package:login_with_email_app/screens/sign_up/views/sign_up_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SPLASHSCREEN(),
      binding: SplashScreenBinding(),
    ),
   
    
    
  ];
}
