import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/home_controller.dart';
import 'package:zingmp5/Source/Widgets/build_nav.dart';
import 'package:zingmp5/Source/Widgets/images_slider.dart';
import 'package:zingmp5/Source/Widgets/playlist_section.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageSlider(imageUrls: homeController.images),
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavCircleButton(
                      icon: Icons.favorite,
                      label: "Yêu thích",
                      color: Colors.pinkAccent),
                  NavCircleButton(
                      icon: Icons.playlist_add_check,
                      label: "Danh sách phát",
                      color: Colors.blue),
                  NavCircleButton(
                      icon: Icons.upload,
                      label: "Đăng bài hát",
                      color: Colors.green),
                  NavCircleButton(
                      icon: Icons.download,
                      label: "Tải xuống",
                      color: Colors.purple),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Playlist gợi ý",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                PlaylistSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
