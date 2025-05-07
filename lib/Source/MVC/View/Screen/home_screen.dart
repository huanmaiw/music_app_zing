import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/home_controller.dart';
import 'package:zingmp5/Source/Widgets/build_nav.dart';
import 'package:zingmp5/Source/Widgets/images_slider.dart';

import '../play_list_screen.dart';
import 'favoritesongscreen.dart';
import 'music_player_screen.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.put(HomeController());

  HomeScreen({super.key});

  final List<Map<String, String>> initialPlaylists = [
    {
      "image": "assets/slider_image/sl1.jpg",
      "title": "Flow Này Mượt Phết",
      "artists": "VSTRA, 52Hz, tlinh, CoolKid",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    },
    {
      "image": "assets/slider_image/sl2.jpg",
      "title": "Lofi Hits",
      "artists": "Jasper, That Lofi Guy, soave lofi",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    },
    {
      "image": "assets/slider_image/sl3.jpg",
      "title": "Nhạc Chill Hay Nhất",
      "artists": "Kai Đinh, Bảo Anh, W/N, Da LAB",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    },
    {
      "image": "assets/slider_image/sl4.jpg",
      "title": "Lofi Một Chút Thôi",
      "artists": "Freak D, W/N, Khải Đăng",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    },
    {
      "image": "assets/slider_image/sl5.jpg",
      "title": "Nhẹ Nhàng Cùng V-Pop",
      "artists": "Nguyên Hà, Vy Vy",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    },
    {
      "image": "assets/slider_image/sl6.jpg",
      "title": "Playlist Này Chill Phết",
      "artists": "Hoàng Dũng, GREY D",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    },
  ];


  @override
  Widget build(BuildContext context) {
    if (homeController.playlists.isEmpty) {
      homeController.playlists.addAll(initialPlaylists);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(imageUrls: homeController.images),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavCircleButton(
                  icon: Icons.favorite,
                  label: "Yêu thích",
                  color: Colors.pinkAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteSongsScreen(),
                      ),
                    );
                  },
                ),
                NavCircleButton(
                  icon: Icons.playlist_add_check,
                  label: "Danh sách phát",
                  color: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaylistScreen(),
                      ),
                    );
                  },
                ),
                NavCircleButton(
                  icon: Icons.add,
                  label: "Thêm bài hát",
                  color: Colors.green,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          final TextEditingController imageController = TextEditingController();
                          final TextEditingController titleController = TextEditingController();
                          final TextEditingController artistsController = TextEditingController();
                          final TextEditingController urlController = TextEditingController();

                          return AlertDialog(
                            title: const Text("Thêm bài hát mới"),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: imageController,
                                    decoration: const InputDecoration(labelText: "Đường dẫn hình ảnh"),
                                  ),
                                  TextField(
                                    controller: titleController,
                                    decoration: const InputDecoration(labelText: "Tiêu đề bài hát"),
                                  ),
                                  TextField(
                                    controller: artistsController,
                                    decoration: const InputDecoration(labelText: "Nghệ sĩ"),
                                  ),
                                  TextField(
                                    controller: urlController,
                                    decoration: const InputDecoration(labelText: "URL bài hát"),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Hủy"),
                              ),
                              TextButton(
                                onPressed: () {
                                  homeController.addSong({
                                    "image": imageController.text,
                                    "title": titleController.text,
                                    "artists": artistsController.text,
                                    "url": urlController.text,
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Thêm"),
                              ),
                            ],
                          );
                        },
                      );
                    }

                ),
                NavCircleButton(
                  icon: Icons.delete,
                  label: "Xóa bài hát",
                  color: Colors.purple,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Chọn bài hát để xóa"),
                          content: Obx(() {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: homeController.playlists.asMap().entries.map((entry) {
                                int index = entry.key;
                                Map<String, dynamic> song = entry.value;
                                return ListTile(
                                  title: Text(song["title"]!),
                                  subtitle: Text(song["artists"]!),
                                  onTap: () {
                                    homeController.deleteSong(index);
                                    Navigator.of(context).pop();
                                  },
                                );
                              }).toList(),
                            );
                          }),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Hủy"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Playlist gợi ý",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 16),
          Obx(() {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: homeController.playlists.length,
              itemBuilder: (context, index) {
                final item = homeController.playlists[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item["image"]!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item["title"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    item["artists"]!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayerScreen(
                          image: item["image"]!,
                          title: item["title"]!,
                          artists: item["artists"]!,
                          audioUrl: item["url"]!,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
