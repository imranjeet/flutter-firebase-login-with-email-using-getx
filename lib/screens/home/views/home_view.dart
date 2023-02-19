import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../global_widgets/app_textfield.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.logOut();
                      // Get.toNamed(Routes.PROFILE);
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 32.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GetBuilder<HomeController>(builder: (value) {
                if (value.user != null) {
                  return Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(controller.user['profilePic']),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${controller.user['name']}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "User type: ${controller.user['userType']}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        Text(
                            "College: ${controller.user['college']}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        Text(
                            "email: ${controller.user['email']}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "phone: ${controller.user['phoneNumber']}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      )),
                    ],
                  );
                } else {
                  return const Center(child: Text("Wait..."));
                }
              }),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: 60.h,
                  child: const CircularProgressIndicator.adaptive(),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
