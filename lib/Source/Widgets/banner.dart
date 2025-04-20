import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView(
        controller: PageController(viewportFraction: 0.7),
        children: [
          _buildBanner("assets/banner/bn1.jpg"),
          _buildBanner("assets/banner/bn2.jpg"),
          _buildBanner("assets/banner/bn3.jpg"),
        ],
      ),
    );
  }

  Widget _buildBanner(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
