import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/text/custom_text.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../utils/colors/app_colors.dart';
import 'widget/found.dart';

class CartView extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final String productQuantity;
  //final String requiredItem;
  const CartView({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      CupertinoIcons.xmark,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.customSizedText(
                        text: 'Cart', fontWeight: FontWeight.w800, size: 18),
                    CustomText.customSizedText(text: productName)
                  ],
                ),
              ],
            ),
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(20),
            //   child: Row(
            //     children: [
            //       TimelineTile(),
            //     ],
            //   ),
            // ),
          ),
          body: cartFound(
              viewModel: viewModel,
              quantity: productQuantity,
              productImage: productImage,
              productName: productName,
              productPrice: productPrice),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText.customSizedText(
                          text: 'Total  ',
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w900,
                          maxLine: 1,
                          size: 18,
                        ),
                        CustomText.customSizedText(
                          text: '(incl. VAT)',
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w900,
                          maxLine: 1,
                          size: 14,
                        ),
                      ],
                    ),
                    CustomText.customSizedText(
                      text: 'Rs. 887.09',
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w900,
                      maxLine: 1,
                      size: 16,
                    ),
                  ],
                ),
                CustomText.customSizedText(
                  text: 'See price breakdown',
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  maxLine: 1,
                  size: 12,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Center(
                    child: CustomText.customSizedText(
                        text: 'Confirm payment and address',
                        fontWeight: FontWeight.w800,
                        color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
