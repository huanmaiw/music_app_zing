import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Thành công", "Đăng ký thành công");

      Get.offAllNamed('/');
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
    }
  }
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Thành công", "Email đặt lại mật khẩu đã được gửi.");
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Thành công", "Đăng nhập thành công");
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
    }
  }

  void logout() async {
    await _auth.signOut();
  }
}
