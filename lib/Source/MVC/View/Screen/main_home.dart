import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/main_controller.dart';
import 'package:zingmp5/Source/Widgets/main_app_bar.dart';
import 'package:zingmp5/Source/Widgets/main_bottom.dart';

import 'account_screen.dart';
import 'find_screen.dart';
import 'home_screen.dart';
import 'rank_screen.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});
  final MainNavController controller = Get.find<MainNavController>();
  @override
  Widget build(BuildContext context) {
    final List<Widget> screen =[
      HomeScreen(),
      const FindScreen(),
      const RankScreen(),
      const AccountScreen(),
    ];
    return Obx(()=>
        Scaffold(
          appBar: const MainAppBar(),
          body: screen [controller.currentIndex.value],
          bottomNavigationBar:const MainBottomNav(),
        )


    );
  }
}
