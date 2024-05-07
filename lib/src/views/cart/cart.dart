import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/reuseable_widget/app_scaffold.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../utils/colors/app_colors.dart';
import 'widget/cart_found.dart';
import 'widget/widget.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, viewModel, child) {
        double deliveryFee = 106.10;
        double platformFee = 8.84;
        double vAT = 102.05;
        if (cart.isEmpty) {
          return appScafold(
              onBackTap: () => viewModel.navigateToBack(),
              appBarTitle: 'Cart',
              body: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.emptyCart,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomText.customSizedText(
                          text: 'Hungry?',
                          size: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomText.customSizedText(
                          text: "You haven't added anything to your cart!",
                          maxLine: 2),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.navigateToHomeView(),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: CustomText.customSizedText(
                            text: 'Browser',
                            color: AppColors.white,
                            size: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ));
        }
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            bottom: timeLineForCart(context),
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
                    CustomText.customSizedText(text: cart[0][4]),
                  ],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: cartFound(viewModel: viewModel, context: context),
          ),
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
                          'Rs. ${(viewModel.totalPrice + deliveryFee + platformFee + vAT).toStringAsFixed(2)}',
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
                  onTap: () => viewModel.navigateToCheckOutView(),
                  child: Container(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
