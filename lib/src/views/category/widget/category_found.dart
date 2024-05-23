import 'package:flutter/material.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import '../../../models/popular_restaurant.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../category_viewmodel.dart';
import 'card.dart';

Widget categoryFound(CategoryViewModel viewModel, PopularRestDelModel model) {
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
              return GestureDetector(
                  onTap: () {
                    viewModel.navigateToResturantDetailView(
                        resturantRating: viewModel.storeRating[index],
                        resturantImage: viewModel.popularResImg[index],
                        deliveryType: viewModel.popularResItemType[index],
                        deliveryPrice: viewModel.popularResText[index],
                        resturantName: viewModel.popularResItemNames[index],
                        deliveryTime: viewModel.popularResDeliveryTimes[index],
                        discountText: viewModel.popularResDiscountText[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: deliveryContainer(
                        context, index, viewModel.getResData!),
                  ));
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
        TabBar(
            splashFactory: NoSplash.splashFactory,
            labelPadding: const EdgeInsets.only(left: 10),
            unselectedLabelColor: Colors.black,
            indicator: const MagnifierDecoration(),
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.primaryColor,
            isScrollable: true,
            tabs: [
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: const Icon(
                    Icons.filter_list_alt,
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: const Row(
                    children: [
                      Text('Sort'),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: const Row(
                    children: [
                      Text('Cuisines'),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: const Row(
                    children: [
                      Text('offers'),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: const Row(
                    children: [
                      Text('Rating 4.0+'),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
            ]),
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: viewModel.popularResImg.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                  onTap: () {
                    viewModel.navigateToResturantDetailView(
                        resturantRating: model.data[index].restaurantsRating,
                        resturantImage: model.data[index].restaurantsImage,
                        deliveryType: model.data[index].runtimeType.toString(),
                        deliveryPrice: model.data[index].minimumPrice,
                        resturantName: model.data[index].restaurantsName,
                        deliveryTime: model.data[index].deliveryTime,
                        discountText: model.data[index].discount);
                  },
                  child: deliveryContainer(
                      context,  index, viewModel.getResData!)),
            );
          },
        ),
      ],
    ),
  );
}
