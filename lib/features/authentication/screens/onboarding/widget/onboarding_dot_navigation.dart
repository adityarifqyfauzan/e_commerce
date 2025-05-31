import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/devices/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDark = HelperFunctions.isDarkMode(context);
    
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: isDark ? TColors.light : TColors.dark,
          dotHeight: 6
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick, 
        count: 3
      ),
    );
  }
}