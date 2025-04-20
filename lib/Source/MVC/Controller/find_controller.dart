import 'package:get/get.dart';

class FindController extends GetxController {
  var suggestions = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuggestions();
  }

  void fetchSuggestions() {
    suggestions.value = [
      {
        "image": "assets/recommen/rcm1.jpg",
        "title": "Thế Thái",
        "artist": "Hương Ly"
      },
      {
        "image": "assets/recommen/rcm2.jpg",
        "title": "Hắc Nguyệt Quang...",
        "artist": "Mao Bất Dịch"
      },
      {
        "image": "assets/recommen/rcm3.jpg",
        "title": "Có Chắc Yêu Là Đây",
        "artist": "Sơn Tùng M-TP"
      },
    ]..shuffle();
  }
}
