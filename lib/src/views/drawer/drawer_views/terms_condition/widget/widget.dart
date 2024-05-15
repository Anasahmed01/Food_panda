import 'package:flutter/material.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

Widget termContentContainer() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: CustomText.customSizedText(
      color: AppColors.white,
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      maxLine: 100,
      textAlign: TextAlign.start,
    ),
  );
}

Widget termConHeading() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: CustomText.customSizedText(
      text: 'Lorem Ipsum Heading',
      maxFontSize: 18,
      minFontSize: 18,
      size: 18,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.justify,
    ),
  );
}
