import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'now_playing.dart';

class SongModel {
  final String title;
  final String artist;
  final String imageUrl;
  final String url;
  final Duration duration;

  SongModel({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.url,
    required this.duration,
  });
}

class PlaylistSection extends StatelessWidget {
   PlaylistSection({super.key});

  final List<SongModel> songs = [
     SongModel(
      title: "Flow Này Mượt Phết",
      artist: "VSTRA, 52Hz, tlinh, CoolKid",
      imageUrl: "assets/recommen/rcm1.jpg",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      duration: const Duration(minutes: 3, seconds: 45),
    ),
    SongModel(
      title: "Thiên lý ơi",
      artist: "Jack",
      imageUrl: "assets/recommen/rcm2.jpg",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      duration: const Duration(minutes: 4, seconds: 15),
    ),
     SongModel(
      title: "Xin đừng KS của anh",
      artist: "Sơn Tường MVP",
      imageUrl: "assets/recommen/rcm3.jpg",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      duration:const Duration(minutes: 4, seconds: 5),
    ),
  ];

  Widget _buildPlaylistItem({
    required SongModel song,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => NowPlayingPage(), arguments: song);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                song.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  song.artist,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          songs.length,
              (index) => _buildPlaylistItem(song: songs[index], context: context),
        ),
      ),
    );
  }
}
