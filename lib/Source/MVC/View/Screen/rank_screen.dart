import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/rank_controller.dart';
import 'package:zingmp5/Source/MVC/Model/chart_item_model.dart';

import 'music_player_screen.dart';

class RankScreen extends StatelessWidget {
  final rankController = Get.put(RankController());

  RankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A003F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child:  Text(
            'Bảng xếp hạng',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Obx(() => ListView.builder(
                itemCount: rankController.chartItems.length,
                itemBuilder: (context, index) {
                  final item = rankController.chartItems[index];
                  return ChartListItem(item: item);
                },
              )),
            ),
          ),
        ],
      ),
    );
  }
}
class ChartListItem extends StatelessWidget {
  final ChartItemModel item;

  const ChartListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell( // <-- Bọc InkWell để bắt sự kiện tap
      onTap: () {
        Get.to(() => MusicPlayerScreen(
          image: item.asset,
          title: item.title,
          artists: item.artist,
          audioUrl: item.audioUrl, // <-- thêm audioUrl
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.asset,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    item.artist,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
