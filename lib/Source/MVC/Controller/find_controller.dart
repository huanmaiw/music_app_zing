import 'package:get/get.dart';

class FindController extends GetxController {
  var suggestions = <Map<String, String>>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuggestions();
  }

  void fetchSuggestions() {
    suggestions.value = [

    ]..shuffle();
  }
}
