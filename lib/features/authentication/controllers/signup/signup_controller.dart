import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  Rx<bool> obscurePassword = true.obs;
  Rx<bool> obscureReTypePassword = true.obs;
  Rx<bool> iAgree = false.obs;

  Rx<String> firstNameError = "".obs;
  Rx<bool> isFirstNameError = true.obs;

  Rx<String> usernameError = "".obs;
  Rx<bool> isUsernameError = true.obs;

  Rx<String> emailError = "".obs;
  Rx<bool> isEmailError = true.obs;

  Rx<String> phoneNumberError = "".obs;
  Rx<bool> isPhoneNumberError = true.obs;

  Rx<String> passwordError = "".obs;
  Rx<bool> isPasswordError = true.obs;

  Rx<String> reTypePasswordError = "".obs;
  Rx<bool> isReTypePasswordError = true.obs;

  final firstNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();

  void validateFirstName() {
    firstNameError.value = "";
    isFirstNameError.value = true;

    if (firstNameController.text.isEmpty) {
      firstNameError.value = "Required!";
    } else {
      isFirstNameError.value = false;
    }
  }

  void validateUsername() {
    usernameError.value = "";
    isUsernameError.value = true;

    if (usernameController.text.isEmpty) {
      usernameError.value = "Username is required!";
    } else {
      isUsernameError.value = false;
    }

    // check another rules like existing username or etc.
  }

  void validateEmail() {
    emailError.value = "";
    isEmailError.value = true;
    if (emailController.text.isEmpty) {
      emailError.value = "Email is required!";
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Email is invalid!";
    } else {
      isEmailError.value = false;
    }

    // check another rules like existing email or etc.
  }

  void validatePhoneNumber() {
    phoneNumberError.value = "";
    isPhoneNumberError.value = true;
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Phone Number is required!";
    } else {
      isPhoneNumberError.value = false;
    }
  }

  void validatePassword() {
    passwordError.value = "";
    isPasswordError.value = true;

    var value = passwordController.text;
    if (value.isEmpty) {
      passwordError.value = "Password is required";
    } else if (value.length < 8) {
      passwordError.value = "Password of at least 8 characters";
    } else {
      isPasswordError.value = false;
    }
  }

  void validateReTypePassword() {
    reTypePasswordError.value = "";
    isReTypePasswordError.value = true;
    if (reTypePasswordController.text.isEmpty) {
      reTypePasswordError.value = "Retype Password is required";
    } else if (reTypePasswordController.text.length < 8) {
      reTypePasswordError.value = "Retype Password of at least 8 characters";
    } else if (passwordController.text != reTypePasswordController.text) {
      reTypePasswordError.value = "Retype Password is not match with Password!";
    } else {
      isReTypePasswordError.value = false;
    }
  }

  void signUp() {
    validateFirstName();
    validateUsername();
    validateEmail();
    validatePhoneNumber();
    validatePassword();
    validateReTypePassword();

    if (isFirstNameError.value || isUsernameError.value || isEmailError.value || isPhoneNumberError.value || isPasswordError.value || isReTypePasswordError.value) {
      // summon toast
      print("is not validate");
      return;
    }

    if (!iAgree.value) {
      print("you must agree with term and condition");      
      return;
    }
    // call api sign up here
    print("call api signup");
  }

  void obscurePasswordField() {
    obscurePassword.value = !obscurePassword.value;
  }

  void obscureReTypePasswordField() {
    obscureReTypePassword.value = !obscureReTypePassword.value;
  }

  void isIAgree(value) {
    iAgree.value = value;
  }
}
