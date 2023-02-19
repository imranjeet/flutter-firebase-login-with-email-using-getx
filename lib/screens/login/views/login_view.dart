import 'package:login_with_email_app/global_widgets/custom_button.dart';
import 'package:login_with_email_app/global_widgets/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_with_email_app/routes/app_pages.dart';

import '../../../global_widgets/app_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      controller.onLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppTextField(
                  controller: controller.email,
                  textFieldType: TextFieldType.EMAIL,
                  isValidationRequired: true,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: textPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextField(
                  controller: controller.password,
                  textFieldType: TextFieldType.PASSWORD,
                  isValidationRequired: true,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: textPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  function: () {
                    _submitForm();
                    controller.onLogin();
                  },
                  title: "Login",
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SIGN_UP);
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Don't have an account. "),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                          
                        ],
                      ),
                    )
                    // Text(
                    //   "Don't have an account.",
                    //   style: TextStyle(
                    //     fontSize: 15.sp,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 40.h,
      //   alignment: Alignment.center,
      //   child: GestureDetector(
      //     onTap: () {
      //       Get.toNamed(Routes.SIGN_UP);
      //     },
      //     child: Text(
      //       "Don't have an account.",
      //       style: TextStyle(
      //         fontSize: 15.sp,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
