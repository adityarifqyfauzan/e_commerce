import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/devices/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextPage extends StatelessWidget {
  const OnBoardingNextPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: isDark ? TColors.primary : TColors.dark, iconColor: isDark ? TColors.light : TColors.light),
        onPressed: () => OnBoardingController.instance.nextPage(), 
        child: Icon(Iconsax.arrow_right_3)
      ),
    );
  }
}