import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.music_note, "title": "Nhạc Việt", "color": Colors.orange.shade200},
      {"icon": Icons.star, "title": "US-UK", "color": Colors.blue.shade200},
      {"icon": Icons.spa, "title": "K-Pop", "color": Colors.pink.shade200},
      {"icon": Icons.face, "title": "Nhạc Thiếu Nhi", "color": Colors.green.shade200},
      {"icon": Icons.directions_run, "title": "Workout", "color": Colors.red.shade200},
      {"icon": Icons.self_improvement, "title": "Relax", "color": Colors.purple.shade200},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Không scroll riêng GridView
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,  // 2 cột
        childAspectRatio: 3, // tỷ lệ rộng/cao
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var item = categories[index];
        return Container(
          decoration: BoxDecoration(
            color: item["color"],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 4), // Đặt bóng đổ phía dưới
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item["icon"], size: 40, color: Colors.deepPurple.shade700),
                const SizedBox(height: 8),
                Text(
                  item["title"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
