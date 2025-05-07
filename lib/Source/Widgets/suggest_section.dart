import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/find_controller.dart';

import 'detail_screen.dart';

class SuggestSection extends StatelessWidget {
  const SuggestSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FindController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Gợi ý cho bạn",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: controller.fetchSuggestions,
              child: const Text(
                "Làm mới",
                style: TextStyle(fontSize: 14, color: Colors.purple),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text("TOP 100", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildSuggestionItem(
              imagePath: "assets/recommen/rcm1.jpg",
              title: "Top 100 Bài Nhạc Trẻ Hay Nhất",
            ),
            const SizedBox(width: 15),
            _buildSuggestionItem(
              imagePath: "assets/recommen/rcm2.jpg",
              title: "Top 100 POP Âu Mỹ Hay Nhất",
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text("CHILL", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildSuggestionItem(
              imagePath: "assets/recommen/rcm3.jpg",
              title: "Top 100 Chill Nhẹ Nhàng",
            ),
            const SizedBox(width: 15),
            _buildSuggestionItem(
              imagePath: "assets/banner/bn1.jpg",
              title: "Top 100 Chill Âu Mỹ",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSuggestionItem({required String imagePath, required String title}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailScreen(imagePath: imagePath, title: title));
      },
      child: Column(
        children: [
          Image.asset(imagePath, height: 150, width: 150, fit: BoxFit.cover),
          const SizedBox(height: 8),
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
