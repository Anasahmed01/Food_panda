import 'package:flutter/material.dart';

import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

Widget listTile({
  bool isIcon = true,
  Widget? leadingWidget,
  String title = '',
  IconData? icon,
  void Function()? onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: isIcon == true
        ? Icon(
            icon,
            color: AppColors.primaryColor,
          )
        : leadingWidget,
    title: CustomText.customSizedText(
      text: title,
      size: 15,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.start,
    ),
  );
}
