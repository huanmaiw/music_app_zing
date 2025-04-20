import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordView extends StatelessWidget {
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: const [
                  Icon(Icons.lock_reset_rounded, color: Colors.white, size: 64),
                  SizedBox(height: 8),
                  Text(
                    "Quên mật khẩu",
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            TextField(
              controller: emailCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Nhập email của bạn",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.deepPurple.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  final email = emailCtrl.text.trim();
                  if (email.isEmpty) {
                    Get.snackbar("Lỗi", "Vui lòng nhập email");
                    return;
                  }
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                    Get.snackbar("Thành công", "Đã gửi email đặt lại mật khẩu đến $email");
                    Get.back(); // Quay lại màn login
                  } catch (e) {
                    Get.snackbar("Lỗi", e.toString());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent.shade200,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Gửi email đặt lại mật khẩu", style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => Get.back(),
                child: const Text("Quay lại đăng nhập", style: TextStyle(color: Colors.white70)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
