import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/account_controller.dart';
import 'package:zingmp5/Source/MVC/View/Screen/setting_screen.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find<AccountController>();

    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset("assets/utm.png"),
        ),
        const SizedBox(width: 16),
        Obx(() => Text( // lắng nghe thay đổi
          accountController.userName.value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        const Spacer(),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingScreen()));
            },
            icon: const Icon(Icons.settings)
        ),
        const SizedBox(width: 12),
        IconButton(
            onPressed: () {
              Get.snackbar(
                "QR Code",
                "Chức năng đang phát triển",
                backgroundColor: Colors.blue,
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
              );
            },
            icon: const Icon(Icons.qr_code_scanner_rounded)
        )
      ],
    );
  }
}
