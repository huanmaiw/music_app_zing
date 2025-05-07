import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';

class ChangePasswordTile extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  ChangePasswordTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.lock, color: Colors.deepPurpleAccent),
      title: const Text("Đổi mật khẩu"),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        oldPasswordController.clear();
        newPasswordController.clear();
        Get.defaultDialog(
          title: "Đổi mật khẩu",
          titleStyle: const TextStyle(fontWeight: FontWeight.bold),
          content: Column(
            children: [
              TextField(
                controller: oldPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Nhập mật khẩu cũ",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Nhập mật khẩu mới",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String oldPassword = oldPasswordController.text.trim();
                  String newPassword = newPasswordController.text.trim();

                  if (oldPassword.isEmpty || newPassword.isEmpty) {
                    Get.snackbar(
                      "Lỗi",
                      "Vui lòng nhập đầy đủ thông tin",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    final authViewModel = Get.find<AuthViewModel>();
                    authViewModel.changePassword(oldPassword, newPassword);
                    Get.back();
                    Get.snackbar(
                      "Thành công",
                      "Mật khẩu đã được đổi",
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Xác nhận", style: TextStyle(color: Colors.white)),
                ),

            ],
          ),
          radius: 10,
        );
      },
    );
  }
}
