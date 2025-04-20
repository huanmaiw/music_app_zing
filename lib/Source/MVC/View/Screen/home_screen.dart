import 'package:flutter/material.dart';
import 'package:zingmp5/Source/Widgets/build_nav.dart';
import 'package:zingmp5/Source/Widgets/images_slider.dart';
import 'package:zingmp5/Source/Widgets/playlist_section.dart';

class HomeScreen extends StatelessWidget {
  final List<String> images = [
    "assets/slider_image/sl1.jpg",
    "assets/slider_image/sl2.jpg",
    "assets/slider_image/sl3.jpg",
    "assets/slider_image/sl4.jpg",
    "assets/slider_image/sl5.jpg",
  ];
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageSlider(imageUrls: images),
        const SizedBox(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical:20 ),
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
        const SizedBox(height: 8,),
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Playlist gợi ý",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              PlaylistSection(),
            ],
          ),
        ),

      ],
    );
  }
}
