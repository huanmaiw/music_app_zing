import 'package:flutter/material.dart';

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
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => const LoginBottomSheet(),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: const StadiumBorder(),
          ),
          child: const Text("Đăng nhập", style: TextStyle(color: Colors.white),),
        ),
        const Spacer(),
        const Icon(Icons.settings),
        const SizedBox(width: 12),
        const Icon(Icons.qr_code_scanner_rounded),
      ],
    );
  }
}
