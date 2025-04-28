import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/View/Screen/setting_screen.dart';

import 'login_bottom_sheet.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
         const SizedBox(width: 16),
        const Text("Nguyễn Minh Chiến", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
         const Spacer(),
         IconButton(onPressed: (){
           Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => const SettingScreen()));
         }, icon: const Icon(Icons.settings)),
         const SizedBox(width: 12),
         IconButton(onPressed: (){
           Get.snackbar("QR Code", "Chức năng đang phát triển",
           backgroundColor: Colors.blue,
             colorText: Colors.white,
             //icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.black);
             duration: const Duration(seconds: 2));
         }, icon: const Icon(Icons.qr_code_scanner_rounded))

      ],
    );
  }
}
