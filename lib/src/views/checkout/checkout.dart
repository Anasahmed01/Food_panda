import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/checkout/checkout_viewmodel.dart';
import 'package:foodpanda/src/views/checkout/widget/widget.dart';
import 'package:stacked/stacked.dart';

import '../../reuseable_widget/app_button.dart';
import '../../reuseable_widget/app_divider.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      builder: (context, viewModel, child) {
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
                    CustomText.customSizedText(text: cart[0][4]),
                  ],
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGreyColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                    CustomText.customSizedText(
                                        text: '   Delivery address',
                                        fontWeight: FontWeight.w800,
                                        size: 18),
                                  ],
                                ),
                                Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(AppImages.googleMap))),
                              height: 110,
                              width: double.infinity,
                            ),
                            CustomText.customSizedText(
                                text: '41 C Mehmood Hussain Road',
                                fontWeight: FontWeight.w800,
                                size: 15),
                            CustomText.customSizedText(
                                text: 'Karachi', size: 15),
                          ],
                        ),
                      ),
                      appDivider(color: AppColors.lightGreyColor, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                            CustomText.customSizedText(
                                text:
                                    '  Add delivery instruction for your rider',
                                fontWeight: FontWeight.w800,
                                size: 14,
                                color: AppColors.primaryColor),
                          ],
                        ),
                      ),
                      appDivider(color: AppColors.lightGreyColor, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 7,
                              child: CustomText.customSizedText(
                                  text:
                                      'Stay active on your registered number so the rider may contact you.',
                                  fontWeight: FontWeight.w800,
                                  textAlign: TextAlign.start,
                                  size: 14,
                                  maxLine: 2,
                                  color: AppColors.blackColor),
                            ),
                            Flexible(
                              child: switchButton(
                                onChanged: (value) {
                                  viewModel.isToggled = value!;
                                  viewModel.rebuildUi();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGreyColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColors.primaryColor,
                          ),
                          CustomText.customSizedText(
                              text: '   Payment method',
                              fontWeight: FontWeight.w800,
                              textAlign: TextAlign.start,
                              size: 18,
                              maxLine: 2,
                              color: AppColors.blackColor),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.primaryColor,
                          ),
                          CustomText.customSizedText(
                              text: '  Add a payment method',
                              fontWeight: FontWeight.w900,
                              size: 14,
                              color: AppColors.primaryColor),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGreyColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.bookmark,
                            color: AppColors.primaryColor,
                          ),
                          CustomText.customSizedText(
                              text: '   Order summary',
                              fontWeight: FontWeight.w800,
                              textAlign: TextAlign.start,
                              size: 18,
                              maxLine: 2,
                              color: AppColors.blackColor),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.primaryColor,
                          ),
                          CustomText.customSizedText(
                              text: '  Add a payment method',
                              fontWeight: FontWeight.w900,
                              size: 14,
                              color: AppColors.primaryColor),
                        ],
                      ),
                    ],
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
