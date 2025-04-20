import 'package:flutter/material.dart';

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Zing MP3 ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "PLUS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Spacer(),
              Icon(Icons.chevron_right),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "19,000đ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            "Nghe nhạc không quảng cáo, mở khóa các tính năng nâng cao",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 12),
          Row(
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
