import 'package:flutter/material.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import '../../../reuseable_widget/text/custom_text.dart';
import '../category_viewmodel.dart';
import 'card.dart';

Widget categoryFound(CategoryViewModel viewModel) {
  return DefaultTabController(
    length: 5,
    child: ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 170,
          child: ListView.builder(
            itemCount: viewModel.dealImages.reversed.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    viewModel.dealImages[index],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: CustomText.customSizedText(
            text: 'Cuisines for you',
            fontWeight: FontWeight.w800,
            size: 18,
            maxFontSize: 18,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: viewModel.cuisinesImages.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        viewModel.cuisinesImages[index],
                        fit: BoxFit.cover,
                        height: 90,
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomText.customSizedText(
                        text: '${viewModel.cuisinesData[index]}',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.customSizedText(
                text: 'Delivery Fee Savers',
                fontWeight: FontWeight.w800,
                size: 18,
                maxFontSize: 18,
              ),
              GestureDetector(
                onTap: () {
                  viewModel.navigateToSeeAllView();
                },
                child: CustomText.customSizedText(
                  text: 'See all',
                  fontWeight: FontWeight.w800,
                  size: 14,
                  color: AppColors.primaryColor,
                  maxFontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            itemCount: viewModel.popularResImg.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return deliveryContainer(context, viewModel, index);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
          child: CustomText.customSizedText(
            text: 'All restaurants',
            fontWeight: FontWeight.w800,
            size: 18,
            maxFontSize: 18,
          ),
        ),
        // Flexible(
        //   flex: 2,
        //   child: ListView.builder(
        //     scrollDirection: Axis.vertical,
        //     itemCount: viewModel.popularResImg.length,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.only(bottom: 10),
        //         child: deliveryContainer(context, viewModel, index),
        //       );
        //     },
        //   ),
        // ),
      ],
    ),
  );
}
