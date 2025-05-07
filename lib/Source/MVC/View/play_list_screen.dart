import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/music_player_controller.dart';
import 'Screen/music_player_screen.dart';

class PlaylistScreen extends StatelessWidget {
  final MusicPlayerController playlistController = Get.put(MusicPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách phát"),
      ),
      body: Obx(() {
        if (playlistController.playlist.isEmpty) {
          return const Center(child: Text("Danh sách phát trống"));
        }
        return ListView.builder(
          itemCount: playlistController.playlist.length,
          itemBuilder: (context, index) {
            final song = playlistController.playlist[index];
            return ListTile(
              leading: Image.asset(song['image'] ?? ''),
              title: Text(song['title'] ?? 'Unknown Title'),
              subtitle: Text(song['artists'] ?? 'Unknown Artist'),
              onTap: () {
                Get.to(() => MusicPlayerScreen(
                  image: song['image'] ?? '',
                  title: song['title'] ?? 'Unknown Title',
                  artists: song['artists'] ?? 'Unknown Artist',
                  audioUrl: song['url'] ?? '',
                ));
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  playlistController.playlist.removeAt(index); // Xóa bài hát khỏi playlist
                },
              ),
            );
          },
        );
      }),
    );
  }
}
