import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/login_screen.dart';
import 'package:zingmp5/Source/MVC/View/Screen/Account/register_screen.dart';
import 'package:zingmp5/Source/MVC/View/Screen/account_screen.dart';


final routes = [
  GetPage(name: '/', page: () => LoginView()),
  GetPage(name: '/register', page: () => RegisterView()),
  GetPage(name: '/account', page: () => const AccountScreen()), // thêm dòng này
];
