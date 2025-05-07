import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, String>> favorites = <Map<String, String>>[].obs;
  RxList<Map<String, String>> playlists = <Map<String, String>>[].obs;
  var selectedSongs = <bool>[].obs;
  final List<String> images = [
    "assets/slider_image/sl1.jpg",
    "assets/slider_image/sl2.jpg",
    "assets/slider_image/sl3.jpg",
    "assets/slider_image/sl4.jpg",
    "assets/slider_image/sl5.jpg",
  ];
  void toggleFavorite(Map<String, String> song) {
    if (favorites.contains(song)) {
      favorites.remove(song);
    } else {
      favorites.add(song);
    }
  }
  Future<void> addSong(Map<String, String> song) async {
    try {
      print("Dữ liệu gửi lên Firebase: $song");
      await FirebaseFirestore.instance.collection('songs').add({
        'image': song['image'],
        'title': song['title'],
        'artists': song['artists'],
        'url': song['url'],
        'createdAt': FieldValue.serverTimestamp(),
      });
      playlists.add(song);
      Get.snackbar(
        "Thêm Thành Công",
        "Đã thêm bài hát vào danh sách phát",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Lỗi Thêm Bài Hát",
        "Đã xảy ra lỗi khi thêm bài hát: $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error adding song: $e");
    }
  }

  // void addSong(Map<String, String> song) {
  //   playlists.add(song);
  // }

  void deleteSong(int index) {
    playlists.removeAt(index);
    Get.snackbar("Xóa Thành Công", "Đã xóa bài hát khỏi danh sách phát",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }
}
