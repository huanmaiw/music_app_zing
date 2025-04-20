import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';

import 'forget_pass_screen.dart';
import 'register_screen.dart';

class LoginView extends StatelessWidget {
  final authVM = Get.put(AuthViewModel());

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo or app name
            Center(
              child: Column(
                children: const [
                  Icon(Icons.music_note, color: Colors.white, size: 64),
                  SizedBox(height: 8),
                  Text(
                    "Zing MP5",
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            TextField(
              controller: emailCtrl,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.deepPurple.shade700,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passCtrl,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Mật khẩu",
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.deepPurple.shade700,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => authVM.login(emailCtrl.text, passCtrl.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent.shade200,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Đăng nhập", style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPasswordView());
                  },
                  child: const Text("Quên mật khẩu?", style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView()));
                },
                child: const Text(
                  "Chưa có tài khoản? Đăng ký",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
