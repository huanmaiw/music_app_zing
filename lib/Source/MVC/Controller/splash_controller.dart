import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zingmp5/Source/MVC/Model/splash_model.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  final SplashModel model = SplashModel();

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: model.animationDuration,
    )..forward();

    scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Navigate to the next screen after animation completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offNamed('/main'); // Replace with your desired route
      }
    });
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}