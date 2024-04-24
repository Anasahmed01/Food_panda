import 'package:flutter/material.dart';
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
      ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
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
      )
    ],
  );
}
