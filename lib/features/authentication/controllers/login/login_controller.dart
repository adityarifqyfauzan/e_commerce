import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  void toCreateAccountPage() {
    Get.to(() => SignUpScreen());
  }
}