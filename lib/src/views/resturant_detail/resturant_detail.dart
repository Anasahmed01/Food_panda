import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/resturant_detail/resturant_detail_viewmodel.dart';
import 'package:foodpanda/src/views/resturant_detail/widget/found.dart';
import 'package:stacked/stacked.dart';
import '../../reuseable_widget/text/custom_text.dart';
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
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  viewModel.navigateToBack();
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
            actions: const [
              SizedBox(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.favorite_border_rounded, size: 22),
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
        );
      },
    );
  }
}
