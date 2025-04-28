import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Controller/main_controller.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/forget_pass_screen.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/login_screen.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/register_screen.dart';
import 'package:zingmp5/Source/MVC/View/Screen/home_screen.dart';
import 'package:zingmp5/Source/MVC/View/Screen/main_home.dart';
import 'package:zingmp5/Source/MVC/View/Screen/splash_screen.dart';
import 'package:zingmp5/Core/Service/Firebase/auth_account.dart';
import 'package:zingmp5/Source/MVC/Controller/forgot_password_controller.dart';
import 'package:zingmp5/Source/MVC/Controller/home_controller.dart';
import 'package:zingmp5/Source/MVC/Controller/login_controller.dart';
import 'package:zingmp5/Source/MVC/Controller/register_controller.dart';
import 'package:zingmp5/Source/MVC/Controller/splash_controller.dart';

abstract class AppRoutes {
  static const forgotPassword = '/forgot-password';
  static const login = '/login';
  static const register = '/register';
  static const splash = '/splash';
  static const home = '/home';
  static const main = '/main';
}

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ForgotPasswordController());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => AuthViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RegisterController());
      }),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainHome(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthViewModel(), fenix: true);
        Get.lazyPut(() => MainNavController());
      }),
    ),
  ];
}