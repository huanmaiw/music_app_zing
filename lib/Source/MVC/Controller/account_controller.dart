import 'package:get/get.dart';

class AccountController extends GetxController {
  var userName = "Nguyễn Minh Chiến".obs;

  void updateName(String newName) {
    userName.value = newName;
  }
}
