import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/login_controller.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/login_screen.dart';
import 'package:zingmp5/Source/Widgets/change_pass.dart';
import 'package:zingmp5/Source/Widgets/rename.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RenameTile(),
              const Divider(),
              ChangePasswordTile(),
              const Divider(),
              ListTile(
                title: const Text("Đăng xuất"),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Get.lazyPut(() => LoginController());
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>const LoginView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}