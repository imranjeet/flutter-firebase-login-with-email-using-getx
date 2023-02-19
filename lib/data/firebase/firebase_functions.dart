import 'dart:developer';
import 'dart:io';

import 'package:login_with_email_app/data/const.dart';
import 'package:login_with_email_app/global_widgets/indicator.dart';
import 'package:login_with_email_app/models/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var isLoading = false.obs;

  Future<void> createUserCredential(
    File image,
    File? pdfFile,
    String name,
    String email,
    String phone,
    String userType,
    String college,
    String year,
    String password,
  ) async {
    try {
      String imageUrl = await uploadFile(image);
      String pdfUrl =
          pdfFile == null ? "null" : await uploadFile(pdfFile, isPdf: true);
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({
        "uid": _auth.currentUser!.uid,
        "email": email,
        "password": password,
        "name": name,
        "phoneNumber": phone,
        "userType": userType,
        "college": college,
        "year": year,
        "profilePic": imageUrl,
        "resume": pdfUrl
      }).then((value) {
        showAlert("successfully");
        Indicator.closeLoading();
        Get.toNamed(Routes.HOME);
      });
    } on FirebaseException catch (e) {
      print(e.toString());
      showAlert(e.toString());
    }
  }

  Future<String> uploadFile(File file, {bool isPdf = false}) async {
    try {
      String imageName = generateId();
      String ext = isPdf == true ? 'pdf' : 'jpg';

      var refrence = _storage.ref().child("/files").child("/$imageName.$ext");

      var uploadTask = await refrence.putFile(file);

      String url = await uploadTask.ref.getDownloadURL();

      return url;
    } catch (e) {
      showAlert("$e");
      return "null";
    }
  }

  Future<dynamic> getCurrentUser() async {
    try {
      var snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      return snapshot;
    } catch (e) {
      showAlert("$e");
      return "";
    }
  }
}
