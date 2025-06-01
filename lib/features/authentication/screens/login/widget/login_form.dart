import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// email
            Obx(
              () => TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  label: Text(TTexts.email),
                  errorText:
                      controller.emailError.value.isEmpty
                          ? null
                          : controller.emailError.value,
                ),
                onChanged: (_) => controller.validateEmail(),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// password
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  label: Text(TTexts.password),
                  suffix: GestureDetector(
                    onTap: controller.obscurePasswordField,
                    child: Icon(
                      controller.obscurePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                  errorText:
                      controller.passwordError.value.isEmpty
                          ? null
                          : controller.passwordError.value,
                ),
                controller: controller.passwordController,
                onChanged: (_) => controller.validatePassword(),
                obscureText: controller.obscurePassword.value,
              ),
            ),

            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        onChanged: controller.rememberMe,
                        value: controller.rememberMeState.value,
                      ),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                /// forgot password
                TextButton(
                  onPressed: () {},
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.signIn,
                child: Text(TTexts.signIn),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            /// create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: controller.toCreateAccountPage,
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
