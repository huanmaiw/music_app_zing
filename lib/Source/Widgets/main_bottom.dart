import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/main_controller.dart';

import 'nav_item.dart';
class MainBottomNav extends StatelessWidget {
  const MainBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainNavController>();

    const List<NavItem> navItems = [
      NavItem(icon: Icons.home, label: "Trang chủ",),
      NavItem(icon: Icons.search, label: "Khám phá"),
      NavItem(icon: Icons.area_chart, label: "BXH"),
      NavItem(icon: Icons.account_circle, label: "Tài khoản"),
    ];

    return Obx(() => NavigationBar(
      height: 70,
      elevation: 4,
      backgroundColor: Colors.white,
      indicatorColor: Colors.purple.shade300,
      selectedIndex: controller.currentIndex.value,
      onDestinationSelected: controller.changeTab,
      destinations: navItems
          .map((item) => NavigationDestination(
        icon: Icon(item.icon),
        label: item.label,
      ))
          .toList(),
    ));
  }
}

