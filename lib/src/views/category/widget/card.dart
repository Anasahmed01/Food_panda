import 'package:flutter/material.dart';

import '../../../reuseable_widget/text/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../category_viewmodel.dart';

Widget discountContainerForCat({required String text}) {
  return Container(
    margin: const EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
        color: AppColors.primaryColor, borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.all(2),
          child: Icon(
            Icons.percent_rounded,
            color: AppColors.primaryColor,
            size: 8,
          ),
        ),
        CustomText.customSizedText(
            text: text,
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            size: 12,
            maxFontSize: 12,
            minFontSize: 12),
      ],
    ),
  );
}

Widget deliveryContainer(
    BuildContext context, CategoryViewModel viewModel, int index) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreyColor),
        borderRadius: BorderRadius.circular(10)),
    width: MediaQuery.sizeOf(context).width * 0.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(
              viewModel.popularResImg[index],
              width: double.infinity,
              fit: BoxFit.fitHeight,
              height: 200,
            ),
          ),
          Positioned(
            left: 10,
            top: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                discountContainerForCat(text: viewModel.popularResText[index]),
                discountContainerForCat(
                    text: viewModel.popularResDiscountText[index]),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(5),
              child: const Icon(
                size: 16,
                Icons.favorite_outline_rounded,
              ),
            ),
          ),
        ]),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          //    width: MediaQuery.sizeOf(context).width * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: CustomText.customSizedText(
                      text: viewModel.popularResItemNames[index],
                      fontWeight: FontWeight.w800,
                      size: 14,
                      minFontSize: 14,
                      maxFontSize: 14,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.orangeAccent,
                          size: 18,
                        ),
                        CustomText.customSizedText(
                          text: ' ${viewModel.storeRating[index]}',
                          fontWeight: FontWeight.w800,
                          size: 12,
                          maxFontSize: 12,
                        ),
                        CustomText.customSizedText(
                          text: ' (5000+)',
                          fontWeight: FontWeight.w800,
                          color: AppColors.greyColor,
                          size: 12,
                          maxFontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: CustomText.customSizedText(
                  text: "\$\$\$  -  ${viewModel.popularResItemType[index]}",
                  color: AppColors.greyColor,
                  size: 12,
                  maxFontSize: 12,
                ),
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Colors.grey[700],
                        size: 14,
                      ),
                      CustomText.customSizedText(
                        text:
                            ' ${viewModel.popularResDeliveryTimes[index]} min  -  ',
                        fontWeight: FontWeight.w800,
                        color: AppColors.greyColor,
                        size: 12,
                        maxFontSize: 12,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.delivery_dining_sharp,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                      CustomText.customSizedText(
                        color: AppColors.primaryColor,
                        text: ' Gift: Free',
                        fontWeight: FontWeight.w900,
                        size: 12,
                        maxFontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
