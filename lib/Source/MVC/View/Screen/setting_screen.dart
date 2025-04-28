import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Cài đặt")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Đổi ảnh đại diện
              ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text("Đổi ảnh đại diện"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.snackbar("Đổi ảnh", "Chức năng đang phát triển",
                      backgroundColor: Colors.blue, colorText: Colors.white);
                },
              ),
              const Divider(),

              // Đổi tên
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.deepPurpleAccent),
                title: const Text("Đổi tên"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.defaultDialog(
                    title: "Đổi tên",
                    content: TextField(
                      decoration: const InputDecoration(
                        hintText: "Nhập tên mới",
                      ),
                      onSubmitted: (value) {
                        // Gọi API đổi tên từ controller
                        final authController = Get.find<AuthViewModel>();
                        authController.updateName(value);
                      },
                    ),
                  );
                },
              ),
              const Divider(),

              // Đổi mật khẩu
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.deepPurpleAccent),
                title: const Text("Đổi mật khẩu"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.defaultDialog(
                    title: "Đổi mật khẩu",
                    content: Column(
                      children: [
                        TextField(
                          controller: oldPasswordController,
                          decoration: const InputDecoration(hintText: "Nhập mật khẩu cũ"),
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: newPasswordController,
                          decoration: const InputDecoration(hintText: "Nhập mật khẩu mới"),
                          obscureText: true,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String oldPassword = oldPasswordController.text;
                            String newPassword = newPasswordController.text;

                            // Gọi API đổi mật khẩu từ controller
                            final authController = Get.find<AuthViewModel>();
                            authController.changePassword(oldPassword, newPassword);
                          },
                          child: const Text("Đổi mật khẩu"),
                        ),
                      ],
                    ),
                    textCancel: "Hủy",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
