import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature_icon.dart';

class UpgradeCard extends StatelessWidget {
  const UpgradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFECE2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Zing MP5 ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                "PLUS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const Spacer(),
              IconButton(onPressed: (){
                Get.snackbar("Thông báo", "Chức năng này đang được phát triển",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                );
                },
                  icon: const Icon(Icons.chevron_right)),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "30,000,000đ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Nghe nhạc không quảng cáo, mở khóa các tính năng nâng cao",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              FeatureIcon(icon: Icons.block, text: "Loại bỏ toàn bộ\nquảng cáo"),
              FeatureIcon(icon: Icons.download_for_offline, text: "Tải nhạc không\n giới hạn số lượng"),
              FeatureIcon(icon: Icons.tune, text: "Phát nhạc theo\nthứ tự tuỳ thích"),
            ],
          ),
        ],
      ),
    );
  }
}
