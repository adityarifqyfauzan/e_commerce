import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/screens/login/widget/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widget/login_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title and subtitle
              LoginHeader(),
              
              /// form
              LoginForm(),

              /// divider
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              SizedBox(height: TSizes.spaceBtwSections),

              /// footer
              SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
