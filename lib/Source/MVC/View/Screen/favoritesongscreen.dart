import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/music_player_controller.dart';

import 'music_player_screen.dart';

class FavoriteSongsScreen extends StatelessWidget {
  final MusicPlayerController controller = Get.put(MusicPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách yêu thích"),),
      
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(
            child: Text(
              "Chưa có bài hát yêu thích",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.favorites.length,
            itemBuilder: (context, index) {
              var song = controller.favorites[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    song['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  song['title']!,
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  song['artists']!,
                  style: const TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {
                    Get.to(() => MusicPlayerScreen(
                      image: song['image']!,
                      title: song['title']!,
                      artists: song['artists']!,
                      audioUrl: song['url']!,
                    ));
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
