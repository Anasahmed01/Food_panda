import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/porduct_detail/product_detail_viewmodel.dart';
import 'package:foodpanda/src/views/porduct_detail/widget/found.dart';
import 'package:stacked/stacked.dart';
import '../../reuseable_widget/text/custom_text.dart';
import '../../utils/colors/app_colors.dart';

class ProductDetailView extends StatelessWidget {
  final String deliveryTime;
  final String deliveryType;
  final String deliveryPrice;
  final String productName;
  final String discountText;
  const ProductDetailView(
      {super.key,
      required this.deliveryTime,
      required this.productName,
      required this.deliveryType,
      required this.deliveryPrice,
      required this.discountText});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductDetailViewModel(),
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
              viewModel: viewModel,
              discountText: discountText,
              productName: productName,
              deliveryPrice: deliveryPrice,
              deliveryTime: deliveryTime,
              deliveryType: deliveryType),
        );
      },
    );
  }
}
