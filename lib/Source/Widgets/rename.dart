import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/account_controller.dart';

class RenameTile extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final AccountController accountController = Get.find<AccountController>(); // <-- lấy controller đã khởi tạo

  RenameTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.edit, color: Colors.deepPurpleAccent),
      title: const Text("Đổi tên"),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        _nameController.clear();
        Get.defaultDialog(
          title: "Đổi tên",
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Nhập tên mới",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String newName = _nameController.text.trim();
                  if (newName.isNotEmpty) {
                    accountController.updateName(newName); // cập nhật tên tại đây
                    Get.back();
                    Get.snackbar(
                      "Thành công",
                      "Tên đã được đổi thành $newName",
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      "Lỗi",
                      "Vui lòng nhập tên mới",
                      backgroundColor: Colors.red,
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
