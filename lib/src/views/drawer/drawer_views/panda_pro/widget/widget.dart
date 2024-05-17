import 'package:flutter/material.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

Widget pandaProListTile(
    {required String title, required String subtitle, required leading}) {
  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.lightGreyColor),
      borderRadius: BorderRadius.circular(12),
    ),
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      fontWeight: FontWeight.w800,
      textAlign: TextAlign.start,
      maxLine: 2,
      size: 14,
    ),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: CustomText.customSizedText(
        text: subtitle,
        textAlign: TextAlign.start,
        maxLine: 2,
        size: 12,
      ),
    ),
  );
}

Widget pandaProExpTile({required String title, required String subTitle}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: AppColors.white, borderRadius: BorderRadius.circular(15)),
    child: ExpansionTile(
      iconColor: AppColors.primaryColor,
      collapsedIconColor: AppColors.primaryColor,
      childrenPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      shape: Border.all(color: Colors.transparent),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      children: [
        Text(
          subTitle,
        ),
      ],
    ),
  );
}
