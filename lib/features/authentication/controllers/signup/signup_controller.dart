import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
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
  Rx<String> countryCode = "".obs;

  Rx<bool> isPasswordError = true.obs;
  var passwordErrors = <String>[].obs;

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
    var value = firstNameController.text;
    if (value.isEmpty) {
      firstNameError.value = "Required!";
    } else {
      isFirstNameError.value = false;
    }
  }

  void validateUsername() {
    usernameError.value = "";
    isUsernameError.value = true;
    var value = usernameController.text;
    if (value.isEmpty) {
      usernameError.value = "Username is required!";
    } else {
      usernameController.text = value;
      isUsernameError.value = false;
    }

    // check another rules like existing username or etc.
  }

  void validateEmail() {
    emailError.value = "";
    isEmailError.value = true;
    var value = emailController.text;
    if (value.isEmpty) {
      emailError.value = "Email is required!";
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = "Email is invalid!";
    } else {
      isEmailError.value = false;
    }

    // check another rules like existing email or etc.
  }

  void validatePhoneNumber() {
    phoneNumberError.value = "";
    isPhoneNumberError.value = true;
    var value = phoneNumberController.text;
    if (value.isEmpty) {
      phoneNumberError.value = "Phone Number is required!";
    } else {
      isPhoneNumberError.value = false;
    }
  }

  String completedPhoneNumber() {
    return countryCode + phoneNumberController.text;
  }

  void validatePassword() {
    final errors = <String>[];
    isPasswordError.value = true;
    var value = passwordController.text;
    if (value.isEmpty) {
      errors.add("Password cannot be empty.");
    }  
    
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      errors.add("At least 1 lowercase letter.");
    }  
    
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      errors.add("At least 1 uppercase letter.");
    }  
    
    if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
      errors.add("At least 1 number.");
    }  
    
    if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) {
      errors.add("At least 1 special character.");
    }  
    
    if (value.length < 8) {
      errors.add("Minimum 8 characters.");
    } 

    passwordErrors.value = errors;
    isPasswordError.value = errors.isNotEmpty;
  }

  void validateReTypePassword() {
    reTypePasswordError.value = "";
    isReTypePasswordError.value = true;
    var value = reTypePasswordController.text;
    if (value.isEmpty) {
      reTypePasswordError.value = "Retype Password is required";
    } else if (value.length < 8) {
      reTypePasswordError.value = "Retype Password of at least 8 characters";
    } else if (passwordController.text != value) {
      reTypePasswordError.value = "Retype Password is not match with Password!";
    } else {
      isReTypePasswordError.value = false;
    }
  }

  void signUp() async {
    validateFirstName();
    validateUsername();
    validateEmail();
    validatePhoneNumber();
    validatePassword();
    validateReTypePassword();

    if (isFirstNameError.value ||
        isUsernameError.value ||
        isEmailError.value ||
        isPhoneNumberError.value ||
        isPasswordError.value ||
        isReTypePasswordError.value) {
      // summon toast
      return;
    }
    if (!iAgree.value) {
      Loaders.errorSnackBar(title: "Ups", message: TTexts.privacyPolicyTermOfUseError);
      return;
    }
    // call api sign up here
    FullScreenLoader.openLoadingDialog("Please Wait!", TImages.loadingJuggle);
    await Future.delayed(const Duration(seconds: 3));
    FullScreenLoader.stopLoading();
    Get.off(() => const VerifyEmailScreen());
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
