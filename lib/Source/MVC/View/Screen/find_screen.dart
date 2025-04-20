import 'package:flutter/material.dart';
import 'package:zingmp5/Source/Widgets/banner.dart';
import 'package:zingmp5/Source/Widgets/suggest_section.dart';
class FindScreen extends StatelessWidget {
  const FindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            BannerSection(),
            SizedBox(height: 24),
            SuggestSection(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
