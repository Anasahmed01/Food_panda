import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/views/checkout/checkout_viewmodel.dart';
import 'package:foodpanda/src/views/checkout/widget/widget.dart';
import 'package:stacked/stacked.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';
import 'widget/checkout_found.dart';

class CheckoutView extends StatelessWidget {
  final double totalPrice;
  const CheckoutView(
      {super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      builder: (context, viewModel, child) {
        double deliveryFee = 106.10;
        double platformFee = 8.84;
        double vAT = 102.05;
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            bottom: timeLineForCheckOut(context),
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
                        text: 'Checkout',
                        fontWeight: FontWeight.w800,
                        size: 18),
                    CustomText.customSizedText(text: cart[0]["resturant_name"].toString()),
                  ],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: checkoutFound(
                  viewModel: viewModel,
                  totalPrice: totalPrice,
                  )),
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
                      text:
                          'Rs. ${(totalPrice + deliveryFee + platformFee + vAT).toStringAsFixed(2)}',
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
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor),
                    child: Center(
                      child: CustomText.customSizedText(
                          text: 'Place order',
                          fontWeight: FontWeight.w800,
                          color: AppColors.white),
                    ),
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
