import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Core/Router/app_routes.dart';
import 'package:zingmp5/Source/MVC/Controller/login_controller.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Thành công", "Đăng ki thành công",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
    }
  }
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Thành công", "Email đặt lại mật khẩu đã được gửi.");
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Thành công", "Đăng nhập thành công",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.lazyPut(()=>LoginController());
      Get.offAllNamed(AppRoutes.main);
    } catch (e) {
      Get.snackbar("Lỗi", "Thông tin tài khoản hoặc mật khẩu không chính xác",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        Get.snackbar("Lỗi", "Bạn chưa đăng nhập.",
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }
      final AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      Get.snackbar("Thành công", "Mật khẩu đã được thay đổi.",
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Lỗi", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
  Future<void> updateName(String newName) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(newName);
        Get.snackbar("Thành công", "Tên đã được cập nhật",
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể cập nhật tên: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
  void logout() async {
    await _auth.signOut();
  }
}
