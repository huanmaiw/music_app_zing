import 'package:get/get.dart';

class MainNavController  extends GetxController {
  RxInt currentIndex = 0.obs;
  void changeTab (int index){
    currentIndex.value= index;
  }
}
