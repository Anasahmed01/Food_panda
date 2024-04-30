// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

Widget productDetailCon(
    {required String image,
    required String productName,
    required productPrice}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage(
          image,
        ),
      ),
    ),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: CustomText.customSizedText(
              text: productName,
              fontWeight: FontWeight.w800,
              size: 14,
              maxFontSize: 14,
              minFontSize: 14,
              maxLine: 1,
              color: AppColors.white),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 10,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ], color: AppColors.white, borderRadius: BorderRadius.circular(15)),
            child: CustomText.customSizedText(
                text: 'Rs. ${productPrice}',
                fontWeight: FontWeight.w800,
                size: 12,
                color: AppColors.blackColor),
          ),
        ),
      ],
    ),
  );
}

Widget ratingContainer() {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      width: 250,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.customSizedText(
              text: dummyText,
              maxLine: 3,
              maxFontSize: 12,
              textAlign: TextAlign.left,
              minFontSize: 12),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 16,
              ),
              const Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 16,
              ),
              const Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 16,
              ),
              const Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 16,
              ),
              const Icon(
                Icons.star_border,
                color: Colors.orangeAccent,
                size: 16,
              ),
              CustomText.customSizedText(
                  text: '  -  Sohail  -  4 days ago',
                  maxLine: 1,
                  maxFontSize: 11,
                  color: AppColors.greyColor,
                  textAlign: TextAlign.left,
                  minFontSize: 11)
            ],
          ),
        ],
      ),
    ),
  );
}
