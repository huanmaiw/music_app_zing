// import 'package:get/get.dart';
// import 'package:zingmp5/Source/MVC/Model/song_model2.dart';
//
// class FindController extends GetxController {
//   var suggestions = <Map<String, String>>[].obs; // Danh sách gợi ý
//   var isLoading = false.obs;
//   final MusicService _musicService = MusicService();
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchSuggestions();
//   }
//
//   Future<void> fetchSuggestions() async {
//     isLoading.value = true; // Bắt đầu tải dữ liệu
//     // try {
//     //   var fetchedSuggestions = await _musicService.getSuggestions();
//     //   suggestions.value = fetchedSuggestions;
//     // } catch (e) {
//     //   // Xử lý lỗi nếu có
//     //   print('Error fetching suggestions: $e');
//     // } finally {
//     //   isLoading.value = false; // Kết thúc việc tải dữ liệu
//     // }
//   }
//
// }
