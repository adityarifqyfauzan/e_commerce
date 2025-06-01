import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widget/term_and_condition_checkbox.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      child: Column(
        children: [
          /// first and last name
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                      errorText:
                          controller.firstNameError.value.isEmpty
                              ? null
                              : controller.firstNameError.value,
                    ),
                    onChanged: (_) => controller.validateFirstName(),
                    controller: controller.firstNameController,
                  ),
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwInputFields),

              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// username
          Obx(
            () => TextFormField(
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
                errorText:
                    controller.usernameError.value.isEmpty
                        ? null
                        : controller.usernameError.value,
              ),
              onChanged: (_) => controller.validateUsername(),
              controller: controller.usernameController,
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// email
          Obx(
            () => TextFormField(
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
                errorText:
                    controller.emailError.value.isEmpty
                        ? null
                        : controller.emailError.value,
              ),
              onChanged: (_) => controller.validateEmail(),
              controller: controller.emailController,
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// phone number
          Obx(
            () => TextFormField(
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
                errorText:
                    controller.phoneNumberError.value.isEmpty
                        ? null
                        : controller.phoneNumberError.value,
              ),
              onChanged: (_) => controller.validatePhoneNumber(),
              controller: controller.phoneNumberController,
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// password
          Obx(
            () => TextFormField(
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
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
              onChanged: (_) => controller.validatePassword(),
              controller: controller.passwordController,
              obscureText: controller.obscurePassword.value,
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          Obx(
            () => TextFormField(
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.retypePassword,
                prefixIcon: Icon(Iconsax.password_check),
                suffix: GestureDetector(
                  onTap: controller.obscureReTypePasswordField,
                  child: Icon(
                    controller.obscureReTypePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
                errorText:
                    controller.reTypePasswordError.value.isEmpty
                        ? null
                        : controller.reTypePasswordError.value,
              ),
              obscureText: controller.obscureReTypePassword.value,
              controller: controller.reTypePasswordController,
              onChanged: (_) => controller.validateReTypePassword(),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// term and condition
          const TermAndConditionCheckbox(),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// sign up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.signUp,
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
