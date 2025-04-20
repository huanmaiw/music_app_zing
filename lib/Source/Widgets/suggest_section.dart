import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/find_controller.dart';

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
        const SizedBox(height: 12),
        Obx(() => Column(
          children: controller.suggestions.map((item) {
            return _buildSuggestItem(
              image: item["image"]!,
              title: item["title"]!,
              artist: item["artist"]!,
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildSuggestItem({
    required String image,
    required String title,
    required String artist,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  artist,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}
