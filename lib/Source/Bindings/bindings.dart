
import 'package:get/get.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';
import 'package:zingmp5/Source/MVC/Controller/login_controller.dart';
import 'package:zingmp5/Source/MVC/Controller/splash_controller.dart';


class AppBindings {
  static void setup() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}

