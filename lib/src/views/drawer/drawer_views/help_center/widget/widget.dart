import 'package:flutter/material.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

Widget drawerListTile({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(3),
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      size: 15,
      minFontSize: 15,
      maxFontSize: 15,
      color: color ?? AppColors.blackColor,
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: color ?? AppColors.primaryColor,
    ),
  );
}
