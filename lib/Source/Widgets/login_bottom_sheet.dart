import 'package:flutter/material.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/login_screen.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/lg.jpeg',
            height: 160,
          ),
          const SizedBox(height: 16),
          const Text(
            "Đăng nhập",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: const Text("Đăng nhập qua Email",
              style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height: 12),
          const Text.rich(
            TextSpan(
              text: "Bằng cách đăng nhập, bạn đồng ý với ",
              children: [
                TextSpan(
                  text: "Điều khoản sử dụng",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextSpan(text: " của Zing MP3."),
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
