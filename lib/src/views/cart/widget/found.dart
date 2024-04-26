import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodpanda/src/reuseable_widget/text/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';

Widget cartFound({
  required String quantity,
  required String productImage,
  required String productName,
  required String productPrice,
  required CartViewModel viewModel,
}) {
  return Column(
    children: [
      ListView.separated(
        itemCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Row(
                    children: [
                      CustomText.customSizedText(text: quantity),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(productImage))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.customSizedText(
                        text: productName,
                        maxLine: 3,
                        size: 12,
                        maxFontSize: 12,
                        minFontSize: 12,
                        color: AppColors.primaryColor),
                    SizedBox(
                      width: 100,
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        expandedAlignment: Alignment.topLeft,
                        //enabled: true,
                        title: CustomText.customSizedText(
                          text: 'Pepsi - 345 ml',
                          maxLine: 2,
                          size: 12,
                        ),
                        trailing: Icon(viewModel.customIcon
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_outlined),

                        children: [
                          CustomText.customSizedText(
                              text: 'Next Cola - 345 ml'), 
                        ],
                        onExpansionChanged: (bool expanded) {
                          viewModel.rebuildUi();
                          viewModel.customIcon = expanded;
                          viewModel.rebuildUi();
                        },
                      ),
                    ),
                  ],
                ),
                CustomText.customSizedText(text: 'Rs. $productPrice'),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 100),
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 5, bottom: 5),
                child: Divider(
                  color: Colors.grey[300],
                ),
              ),
            ),
          );
        },
      ),
      const SizedBox(
        height: 20,
      ),
      Divider(
        color: AppColors.lightGreyColor,
        thickness: 10,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                    text: 'Subtotal',
                    maxLine: 1,
                    size: 16,
                    fontWeight: FontWeight.w800),
                CustomText.customSizedText(
                  text: 'Rs. $productPrice',
                  maxLine: 1,
                  fontWeight: FontWeight.w800,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                  text: 'Delivery Fee',
                  maxLine: 1,
                  size: 14,
                ),
                CustomText.customSizedText(
                  text: 'Rs. 106.19',
                  maxLine: 1,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText.customSizedText(
                      text: 'Platform Fee',
                      maxLine: 1,
                      size: 14,
                    ),
                    const Icon(Icons.info_outline_rounded),
                  ],
                ),
                CustomText.customSizedText(
                  text: 'Rs. 8.84',
                  maxLine: 1,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                  text: 'VAT',
                  maxLine: 1,
                  size: 14,
                ),
                CustomText.customSizedText(
                  text: 'Rs. 102.05',
                  maxLine: 1,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.ticket,
                  color: AppColors.primaryColor,
                ),
                CustomText.customSizedText(
                  text: '    Apply a voucher',
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w900,
                  maxLine: 1,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(
        color: AppColors.lightGreyColor,
        thickness: 10,
      ),
    ],
  );
}
