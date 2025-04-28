import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/now_playing_controller.dart';

import 'blur_background.dart';

class NowPlayingPage extends StatelessWidget {
  final controller = Get.put(NowPlayingController());

  NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => BlurBackground(imageUrl: controller.currentSong.value.imageUrl)),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTopBar(),
                const Spacer(),
                _buildSongInfo(),
                const SizedBox(height: 24),
                _buildProgressBar(),
                const SizedBox(height: 24),
                _buildControls(),
                const SizedBox(height: 32),
                _buildBottomBar(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopBar() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.keyboard_arrow_down, color: Colors.white),
        Text('#zingchart', style: TextStyle(color: Colors.white, fontSize: 16)),
        Icon(Icons.more_vert, color: Colors.white),
      ],
    ),
  );

  Widget _buildSongInfo() => Obx(() => Column(
    children: [
      Text(
        controller.currentSong.value.title,
        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 4),
      Text(
        controller.currentSong.value.artist,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    ],
  ));

  Widget _buildProgressBar() => Obx(() => Column(
    children: [
      Slider(
        value: controller.position.value.inSeconds.toDouble(),
        min: 0,
        max: controller.duration.value.inSeconds.toDouble(),
        onChanged: controller.seekTo,
        activeColor: Colors.white,
        inactiveColor: Colors.white24,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.formatTime(controller.position.value), style: const TextStyle(color: Colors.white70)),
            Text(controller.formatTime(controller.duration.value), style: const TextStyle(color: Colors.white70)),
          ],
        ),
      )
    ],
  ));

  Widget _buildControls() => Obx(() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: const Icon(Icons.shuffle, color: Colors.purpleAccent),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.skip_previous, color: Colors.white),
        iconSize: 36,
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(controller.isPlaying.value ? Icons.pause_circle : Icons.play_circle, color: Colors.white),
        iconSize: 64,
        onPressed: controller.playPause,
      ),
      IconButton(
        icon: const Icon(Icons.skip_next, color: Colors.white),
        iconSize: 36,
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.repeat, color: Colors.white54),
        onPressed: () {},
      ),
    ],
  ));

  Widget _buildBottomBar() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text('128 Kbps', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            'Tận hưởng âm nhạc không quảng cáo',
            style: TextStyle(color: Colors.white70),
          ),
        )
      ],
    ),
  );
}
