// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/views/resturant_detail/resturant_detail_viewmodel.dart';
import 'package:foodpanda/src/views/resturant_detail/widget/found.dart';
import 'package:stacked/stacked.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';

class ResturantDetailView extends StatelessWidget {
  final String deliveryTime;
  final String deliveryType;
  final String deliveryPrice;
  final String resturantName;
  final String discountText;
  final String resturantImage;
  final String resturantRating;
  const ResturantDetailView({
    super.key,
    required this.deliveryTime,
    required this.resturantName,
    required this.deliveryType,
    required this.deliveryPrice,
    required this.discountText,
    required this.resturantImage,
    required this.resturantRating,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ResturantDetailViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getRestaurant();
      },
      builder: (context, viewModel, child) {
        if (viewModel.model != null) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                  onTap: () {
                    // viewModel.navigateToBack();
                    viewModel.navigateToHomeView();
                  },
                  child: const Icon(Icons.arrow_back)),
              backgroundColor: AppColors.white,
              iconTheme: IconThemeData(color: AppColors.primaryColor),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.customSizedText(
                    text: 'Delivery',
                    size: 18,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText.customSizedText(
                    text: deliveryTime,
                    size: 12,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              actions: [
                SizedBox(
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () => viewModel.navigateToFavouriteView(),
                          child: Icon(Icons.favorite_border_rounded, size: 22)),
                      Icon(
                        Icons.share_outlined,
                        size: 22,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.search, size: 22),
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: productFound(
                model: viewModel.model!,
                resturantRating: resturantRating,
                viewModel: viewModel,
                resturantImage: resturantImage,
                discountText: discountText,
                resturantName: resturantName,
                deliveryPrice: deliveryPrice,
                deliveryTime: deliveryTime,
                deliveryType: deliveryType),
            bottomNavigationBar: cart.isNotEmpty
                ? GestureDetector(
                    onTap: () => viewModel.navigateToCartView(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      height: 80,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          margin: const EdgeInsets.all(15),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.primaryColor,
                                    border: Border.all(color: AppColors.white)),
                                height: 25,
                                width: 25,
                                child: Center(
                                  child: CustomText.customSizedText(
                                      text: '${cart.length}',
                                      color: AppColors.white),
                                ),
                              ),
                              CustomText.customSizedText(
                                  text: 'View your cart',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w800),
                            ],
                          )),
                    ),
                  )
                : Container(
                    height: 0,
                  ),
          );
        }
        return Container();
      },
    );
  }
}
