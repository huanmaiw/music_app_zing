import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';

class RegisterController extends GetxController {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final authVM = Get.find<AuthViewModel>();

  void register() {
    final email = emailCtrl.text.trim();
    final password = passCtrl.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      authVM.register(email, password);
    } else {
      Get.snackbar(
        'Lỗi',
        'Vui lòng nhập đầy đủ email và mật khẩu',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.onClose();
  }
}
