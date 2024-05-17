import 'package:flutter/material.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

Widget profileContainer({required String title, required String subtitle}) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 15),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 2.0,
        blurStyle: BlurStyle.outer,
        spreadRadius: 0.1,
        offset: const Offset(0, 0),
      ),
    ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.customSizedText(
              text: title,
              size: 16,
            ),
            Icon(
              Icons.edit_outlined,
              color: AppColors.primaryColor,
              size: 26,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: CustomText.customSizedText(
            text: subtitle,
            fontWeight: FontWeight.w900,
            size: 16,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: CustomText.customSizedText(
            text: 'Verified',
            fontWeight: FontWeight.w800,
            size: 13,
          ),
        ),
      ],
    ),
  );
}

Widget profSocialButton({required icon, required String socialName}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 2.0,
        blurStyle: BlurStyle.outer,
        spreadRadius: 0.1,
        offset: const Offset(0, 0),
      ),
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            CustomText.customSizedText(
              text: socialName,
              size: 16,
            ),
          ],
        ),
        CustomText.customSizedText(
          text: 'Connect',
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w900,
          size: 16,
        ),
      ],
    ),
  );
}
