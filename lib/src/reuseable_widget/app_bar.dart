import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import 'custom_text.dart';

PreferredSizeWidget customAppBar({
  required String title,
  required void Function()? onPressed,
}) {
  return AppBar(
    backgroundColor: AppColors.white,
    flexibleSpace: Container(),
    centerTitle: false,
    elevation: 0,
    title: CustomText.customSizedText(
        text: title,
        size: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w800),
    leading: IconButton(
      icon: Icon(
        CupertinoIcons.xmark,
        size: 20,
        color: AppColors.primaryColor,
      ),
      onPressed: onPressed,
    ),
  );
}

AppBar appAppbar(
    {required void Function()? ontap,
    required String title,
    required icon,
    backgroundColor}) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: GestureDetector(
        onTap: ontap,
        child: Icon(
          icon,
          color: AppColors.primaryColor,
        )),
    title: CustomText.customSizedText(
      text: title,
      maxFontSize: 18,
      minFontSize: 18,
      size: 18,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.justify,
    ),
  );
}
