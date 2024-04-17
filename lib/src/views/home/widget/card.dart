import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import '../../../reuseable_widget/text/custom_text.dart';
import '../home_viewmodel.dart';

Widget categoryCard(
    {required BuildContext context,
    required double height,
    required double width,
    required String title,
    required String subTitle,
    required image,
    double? imageHeight,
    margin}) {
  return Container(
    height: height,
    width: width,
    margin: margin,
    child: Container(
        padding: const EdgeInsets.only(top: 10, left: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: height > MediaQuery.sizeOf(context).height * 0.1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                        text: title,
                        fontWeight: FontWeight.w600,
                        size: 18,
                        maxFontSize: 18,
                      ),
                      CustomText.customSizedText(
                          text: subTitle, size: 12, textAlign: TextAlign.left)
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      image,
                      height: imageHeight ?? 80,
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                        text: title,
                        fontWeight: FontWeight.w600,
                        size: 18,
                        maxFontSize: 18,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).height * 0.1,
                        child: CustomText.customSizedText(
                            text: subTitle,
                            size: 12,
                            textAlign: TextAlign.left,
                            maxFontSize: 18,
                            maxLine: 2),
                      )
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      AppImages.foodDelivery,
                      height: imageHeight ?? 50,
                    ),
                  )
                ],
              )),
  );
}

Container discountContainer({required String text}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10), topRight: Radius.circular(10))),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: CustomText.customSizedText(
        text: text, color: AppColors.white, fontWeight: FontWeight.w500),
  );
}

// Widget positionPicker(
//     {required int position,
//     required BuildContext context,
//     required CategoryData model,
//     required HomeViewModel viewModel,
//     required int index}) {
//   if (position == 1) {
//     return categoryCard(
//         height: MediaQuery.sizeOf(context).height * 0.2,
//         width: MediaQuery.sizeOf(context).width * 0.43,
//         title: viewModel.getData == null ? '' : model.data[index].title,
//         subTitle: viewModel.getData == null ? '' : model.data[index].subtitle,
//         context: context);
//   } else if (position == 2) {
//     return categoryCard(
//         height: MediaQuery.sizeOf(context).height * 0.2,
//         width: MediaQuery.sizeOf(context).width * 0.43,
//         title: viewModel.getData == null ? '' : model.data[index].title,
//         subTitle: viewModel.getData == null ? '' : model.data[index].subtitle,
//         context: context);
//   } else {
//     return categoryCard(
//         height: 0,
//         width: 0,
//         title: viewModel.getData == null ? '' : model.data[index].title,
//         subTitle: viewModel.getData == null ? '' : model.data[index].subtitle,
//         context: context);
//   }
// }
Widget popularRestaurants(
    HomeViewModel viewModel, int index, BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(children: [
            Image.asset(
              viewModel.popularResImg[index],
              width: MediaQuery.sizeOf(context).width * 0.65,
            ),
            discountContainer(text: viewModel.popularResText[index]),
            Positioned(
              left: 0,
              top: 40,
              child: discountContainer(
                  text: viewModel.popularResDiscountText[index]),
            ),
          ]),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10),
        width: MediaQuery.sizeOf(context).width * 0.65,
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
                        text: ' 4.2',
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
                text:
                    "\$\$\$  -  PKR ${viewModel.popularResItemPrices[index]}  -  ${viewModel.popularResItemType[index]}",
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
                      size: 18,
                    ),
                    CustomText.customSizedText(
                      text: ' ${viewModel.popularResDeliveryTimes[index]}  -  ',
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
                      text: ' Gift: Free delivery',
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
  );
}
