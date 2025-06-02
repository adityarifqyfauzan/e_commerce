import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PasswordWithValidationField extends StatelessWidget {
  const PasswordWithValidationField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color:
                    controller.passwordErrors.isEmpty
                        ? TColors.grey
                        : TColors.warning,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color:
                    controller.passwordErrors.isEmpty
                        ? TColors.darkGrey
                        : TColors.warning,
                width: 1.5,
              ),
            ),
          ),
          onChanged: (_) => controller.validatePassword(),
          controller: controller.passwordController,
          obscureText: controller.obscurePassword.value,
        ),
        if (controller.passwordErrors.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                controller.passwordErrors
                    .map(
                      (e) => Row(
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(
                              color: TColors.error,
                              fontSize: TSizes.fontSizeSm,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              e,
                              style: const TextStyle(
                                color: TColors.error,
                                fontSize: TSizes.fontSizeSm,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
      ],
    ));
  }
}
