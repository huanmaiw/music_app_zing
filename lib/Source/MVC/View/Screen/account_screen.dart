import 'package:flutter/material.dart';
import 'package:zingmp5/Source/Widgets/account_header.dart';
import 'package:zingmp5/Source/Widgets/feature_grid.dart';
import 'package:zingmp5/Source/Widgets/upgrade_card.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              AccountHeader(),
              SizedBox(height: 20),
              UpgradeCard(),
              SizedBox(height: 24),
              Text(
                "Trải nghiệm nâng cao",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              FeatureGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
