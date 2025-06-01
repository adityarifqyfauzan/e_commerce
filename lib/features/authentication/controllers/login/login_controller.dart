import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  Rx<bool> obscurePassword = true.obs;
  Rx<bool> rememberMeState = false.obs;
  Rx<String> emailError = "".obs;
  Rx<String> passwordError = "".obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void validateEmail() {
    emailError.value = "";
    if (emailController.text.isEmpty) {
      emailError.value = "Email is required!";
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Email is invalid!";
    }
  }

  void validatePassword() {
    passwordError.value = "";
    if (passwordController.text.isEmpty) {
      passwordError.value = "Password is required";
    } else if (passwordController.text.length < 8) {
      passwordError.value = "Password of at least 8 characters";
    }
  }

  void signIn() {
    validateEmail();
    validatePassword();
  }

  void toCreateAccountPage() {
    Get.to(() => SignUpScreen());
  }

  void obscurePasswordField() {
    obscurePassword.value = !obscurePassword.value;
  }

  void rememberMe(value) {
    rememberMeState.value = value;
  }
}