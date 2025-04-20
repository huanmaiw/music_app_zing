import 'package:flutter/material.dart';

class PlaylistSection extends StatelessWidget {
  const PlaylistSection({super.key});

  Widget _buildPlaylistItem({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          _buildPlaylistItem(
            image: "assets/recommen/rcm1.jpg",
            title: "Flow Này Mượt Phết",
            subtitle: "VSTRA, 52Hz, tlinh, CoolKid",
          ),
          _buildPlaylistItem(
            image: "assets/recommen/rcm2.jpg",
            title: "Thiên lý ơi",
            subtitle: "Jack",
          ),
          _buildPlaylistItem(
            image: "assets/recommen/rcm3.jpg",
            title: "Xin đừng KS của anh",
            subtitle: "Sơn Tường MVP",
          ),
        ],
      ),
    );
  }
}
