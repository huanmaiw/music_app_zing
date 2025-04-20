import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A003F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '#zingchart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  '19.04.2025 - 15:22',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                Icon(Icons.bar_chart, color: Colors.white70)
              ],
            ),
          ),
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
              child: ListView(
                children: const [
                  ChartListItem(
                    rank: 1,
                    title: 'Bắc Bling (Bắc Ninh)',
                    artist: 'Hòa Minzy, Xuân Hinh, Tuấn Cry',
                    asset: 'assets/recommen/rcm1.jpg',
                  ),
                  ChartListItem(
                    rank: 2,
                    title: 'Sorry, Anh Mất Em Rồi!',
                    artist: 'Ogenus, Orange',
                    asset: 'assets/recommen/rcm2.jpg',
                  ),
                  ChartListItem(
                    rank: 3,
                    title: 'Nước Mắt Cá Sấu',
                    artist: 'HIEUTHUHAI',
                    asset: 'assets/recommen/rcm3.jpg',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChartListItem extends StatelessWidget {
  final int rank;
  final String title;
  final String artist;
  final String asset;

  const ChartListItem({
    required this.rank,
    required this.title,
    required this.artist,
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$rank',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade700,
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              asset,
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
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  artist,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
