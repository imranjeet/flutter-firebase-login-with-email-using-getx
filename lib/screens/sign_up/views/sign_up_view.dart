import 'package:login_with_email_app/global_widgets/custom_button.dart';
import 'package:login_with_email_app/global_widgets/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global_widgets/app_textfield.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();

  SignUpView({super.key});

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      controller.onCreateAccount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<SignUpController>(builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      /// Get profile image
                      controller.getFromGallery();
                    },
                    child: Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Stack(
                          children: [
                            Center(
                              child: controller.imageFile == null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundColor: greyScaleColor,
                                      child: const Icon(
                                        Icons.person,
                                        size: 70,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          FileImage(controller.imageFile!),
                                    ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 120.h,
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  //   child: Text(
                  //     "LOGIN",
                  //     style: TextStyle(
                  //       fontSize: 40.sp,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: greyScaleColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "User type: ",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              DropdownButton(
                                elevation: 0,
                                value: controller.dropdownvalue,

                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: controller.items.map((String items) {
                                  return DropdownMenuItem(
                                    
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  controller.changeDropdownvalue(newValue!);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                    height: 20.h,
                  ),
                  AppTextField(
                    controller: controller.phone,
                    textFieldType: TextFieldType.PHONE,
                    isValidationRequired: true,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: textPrimaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextField(
                    controller: controller.fullName,
                    textFieldType: TextFieldType.NAME,
                    isValidationRequired: true,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: textPrimaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full name",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextField(
                    controller: controller.collegeName,
                    textFieldType: TextFieldType.NAME,
                    isValidationRequired: true,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: textPrimaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "College name",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextField(
                    controller: controller.year,
                    textFieldType: TextFieldType.PHONE,
                    isValidationRequired: true,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: textPrimaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: controller.yearStr,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: greyScaleColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey),
                                onPressed: () {
                                  controller.getPDFFromGallery();
                                },
                                child: const Text(
                                  "Choose Resume",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 0.42.sw,
                                child: Text(
                                  controller.filename,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    function: () {
                      _submitForm();
                    },
                    title: "Create Account",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Already have an account."),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
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
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            }),
          ),
        ),

        //   Column(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       SizedBox(
        //         height: 100.h,
        //       ),
        //       Container(
        //         width: double.infinity,
        //         padding: EdgeInsets.symmetric(horizontal: 20.sp),
        //         child: Text(
        //           "Sign Up",
        //           style: TextStyle(
        //             fontSize: 40.sp,
        //             color: Colors.black,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 40.h,
        //       ),
        //       ReusableTextField(
        //         isMultiline: false,
        //         hintText: "Full Name",
        //         controller: controller.fullName,
        //       ),
        //       SizedBox(
        //         height: 20.h,
        //       ),
        //       ReusableTextField(
        //         isMultiline: false,
        //         hintText: "Email",
        //         controller: controller.email,
        //       ),
        //       SizedBox(
        //         height: 20.h,
        //       ),
        //       ReusableTextField(
        //         isMultiline: false,
        //         hintText: "Password",
        //         controller: controller.password,
        //       ),
        //       SizedBox(
        //         height: 40.h,
        //       ),
        //       CustomButton(
        //           function: () {
        //             controller.onCreateAccount();
        //           },
        //           title: "Create Account"),
        //     ],
        //   ),
        // ),
        // bottomNavigationBar: Container(
        //   height: 40.h,
        //   alignment: Alignment.center,
        //   child: GestureDetector(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: Text(
        //       "Already have an account.",
        //       style: TextStyle(
        //         fontSize: 15.sp,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
