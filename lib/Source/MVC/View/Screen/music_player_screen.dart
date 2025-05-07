import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/music_player_controller.dart';
import 'package:zingmp5/Source/MVC/View/play_list_screen.dart';

class MusicPlayerScreen extends StatelessWidget {
  final String image;
  final String title;
  final String artists;
  final String audioUrl;

  MusicPlayerScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.artists,
    required this.audioUrl,
  }) : super(key: key);

  final MusicPlayerController controller = Get.put(MusicPlayerController());

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LIVE",
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                const Spacer(),

                // Main cover
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                    width: 280,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 32),

                // Song info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        artists,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Slider progress
                Obx(() => Column(
                  children: [
                    Slider(
                      value: controller.currentPosition.value.inSeconds.toDouble(),
                      min: 0.0,
                      max: controller.totalDuration.value.inSeconds.toDouble() > 0
                          ? controller.totalDuration.value.inSeconds.toDouble()
                          : 1.0,
                      onChanged: (value) {
                        controller.seekTo(Duration(seconds: value.toInt()));
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.white38,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(controller.currentPosition.value),
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            formatDuration(controller.totalDuration.value),
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),

                const SizedBox(height: 8),

                // Controls buttons
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        controller.isShuffle.value ? Icons.shuffle_outlined : Icons.shuffle,
                        color: controller.isShuffle.value ? Colors.red : Colors.white,
                      ),
                      onPressed: controller.toggleShuffle,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        controller.isPlaying.value ? Icons.pause_circle_filled : Icons.play_circle_fill,
                        color: Colors.white,
                        size: 64,
                      ),
                      onPressed: controller.togglePlayPause,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white, size: 36),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        controller.isRepeat.value ? Icons.repeat_on_outlined : Icons.repeat,
                        color: controller.isRepeat.value ? Colors.red : Colors.white,
                      ),
                      onPressed: controller.toggleRepeat,
                    ),
                  ],
                )),

                const SizedBox(height: 24),

                // Bottom row: Favorite + Download
                Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                          color: controller.isFavorite.value ? Colors.pinkAccent : Colors.white,
                        ),
                        onPressed: () {
                          // Gọi toggleFavorite và lưu bài hát vào danh sách yêu thích
                          Map<String, String> song = {
                            'image': image,
                            'title': title,
                            'artists': artists,
                            'url': audioUrl,
                          };
                          controller.toggleFavorite(song);
                        },
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "128 Kbps",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.playlist_add, color: Colors.white),
                        onPressed: () {
                          // Thêm bài hát vào danh sách phát và điều hướng tới PlaylistScreen
                          Map<String, String> song = {
                            'image': image,
                            'title': title,
                            'artists': artists,
                            'url': audioUrl,
                          };
                          final playlistController = Get.find<MusicPlayerController>();
                          playlistController.addSong(song);

                          // Điều hướng đến màn hình danh sách phát
                          Get.to(() => PlaylistScreen());
                        },
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}