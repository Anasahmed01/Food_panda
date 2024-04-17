import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/text/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';

Widget productFound(
    {required String productName,
    required String deliveryType,
    required String deliveryPrice,
    required String discountText,
    required String deliveryTime}) {
  return ListView(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            CustomText.customSizedText(
                text: productName, fontWeight: FontWeight.w800, size: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText.customSizedText(
                        text: '1.3km away | ',
                        fontWeight: FontWeight.w500,
                        size: 12,
                        color: AppColors.greyColor),
                    CustomText.customSizedText(
                      text: deliveryType,
                      fontWeight: FontWeight.w500,
                      size: 12,
                    ),
                  ],
                ),
                CustomText.customSizedText(
                  text: 'More info',
                  fontWeight: FontWeight.w800,
                  size: 12,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText.customSizedText(
                text: 'Rs. $deliveryPrice | Service fee applies',
                fontWeight: FontWeight.w500,
                size: 12,
                color: AppColors.greyColor),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 22,
                      color: AppColors.primaryColor,
                    ),
                    CustomText.customSizedText(
                        text: '   3.7   ',
                        fontWeight: FontWeight.w800,
                        size: 13,
                        color: AppColors.blackColor),
                    CustomText.customSizedText(
                        text: '10000+ ratings',
                        fontWeight: FontWeight.w500,
                        size: 11,
                        color: AppColors.greyColor),
                  ],
                ),
                CustomText.customSizedText(
                    text: 'See reviews',
                    fontWeight: FontWeight.w800,
                    size: 12,
                    color: AppColors.primaryColor),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 22,
                      color: AppColors.primaryColor,
                    ),
                    CustomText.customSizedText(
                        text: '   Delivery: $deliveryTime',
                        fontWeight: FontWeight.w800,
                        size: 13,
                        color: AppColors.blackColor),
                  ],
                ),
                CustomText.customSizedText(
                    text: 'Change',
                    fontWeight: FontWeight.w800,
                    size: 12,
                    color: Colors.grey[300]),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Icon(
                  Icons.view_comfy_alt_rounded,
                  size: 22,
                  color: AppColors.primaryColor,
                ),
                CustomText.customSizedText(
                    text: '   Available deals',
                    fontWeight: FontWeight.w800,
                    size: 13,
                    color: AppColors.greyColor),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 240, 245),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.percent_rounded,
                          color: AppColors.white,
                          size: 8,
                        ),
                      ),
                      CustomText.customSizedText(
                          text: discountText,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          size: 12,
                          maxFontSize: 12,
                          minFontSize: 12),
                    ],
                  ),
                  CustomText.customSizedText(
                      text:
                          'Min. order Rs. 199. Valid for selected items.\nAuto-applied.',
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                      size: 10,
                      maxLine: 2,
                      maxFontSize: 10,
                      minFontSize: 10),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
