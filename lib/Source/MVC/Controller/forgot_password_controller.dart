import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';

class ForgotPasswordController extends GetxController {
  final emailCtrl = TextEditingController();
  final authVM = Get.find<AuthViewModel>();

  void resetPassword() {
    final email = emailCtrl.text.trim();
    if (email.isNotEmpty) {
      authVM.resetPassword(email);
    } else {
      Get.snackbar(
        'Lỗi',
        'Vui lòng nhập email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }
}
