import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

Widget voucherContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.lightGreyColor),
      color: AppColors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 10,
          ),
          leading: Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(3),
            child: Icon(
              Icons.percent_rounded,
              color: AppColors.white,
              size: 24,
            ),
          ),
          title: CustomText.customSizedText(
              text: 'PEHLAORDER', fontWeight: FontWeight.w300, size: 12),
          subtitle: Row(
            children: [
              CustomText.customSizedText(
                text: 'Rs. 250.00',
                fontWeight: FontWeight.w800,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(
                  CupertinoIcons.info_circle,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
              ),
              CustomText.customSizedText(
                  text: 'PEHLAORDER', color: AppColors.greyColor, size: 12),
            ],
          ),
        ),
        DottedLine(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          lineLength: double.infinity,
          lineThickness: 1.0,
          dashLength: 4.0,
          dashColor: AppColors.lightGreyColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.only(
                    right: 5, left: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    color: AppColors.lightLightGreyColor,
                    borderRadius: BorderRadius.circular(30)),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: CustomText.customSizedText(
                    text: 'Min. spend Rs. 999 - Use by 31 Dec 2024',
                    maxFontSize: 12,
                    size: 12,
                    minFontSize: 12),
              ),
            ),
            Flexible(
                child: CustomText.customSizedText(
                    text: 'Details',
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor)),
          ],
        ),
      ],
    ),
  );
}
