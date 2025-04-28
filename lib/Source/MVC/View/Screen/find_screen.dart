import 'package:flutter/material.dart';
import 'package:zingmp5/Source/Widgets/banner.dart';
import 'package:zingmp5/Source/Widgets/suggest_section.dart';

class FindScreen extends StatelessWidget {
  const FindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon:  Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide:  BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const BannerSection(),  // Banner Top 100
            const SizedBox(height: 24),
            const SizedBox(height: 12),
            const SuggestSection(),
            const SizedBox(height: 24),

            //const SectionHeader(title: "Chủ đề & thể loại"),
            //const SizedBox(height: 12),
           // const CategorySection(), // Category GridView
//const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.chevron_right, size: 28),
      ],
    );
  }
}
