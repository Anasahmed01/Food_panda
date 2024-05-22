import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/sub_payment/sub_payment_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../reuseable_widget/custom_text.dart';

class SubscriptionView extends StatelessWidget {
  final String month;
  final String subsPrice;
  const SubscriptionView(
      {super.key, required this.month, required this.subsPrice});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SubscriptionViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
            ontap: () => viewModel.navigateToBack(),
            title: "Confirm payment method",
            icon: Icons.arrow_back,
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Pandapro',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Subscription',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rs. $subsPrice ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' billed every $month months',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.tickets,
                          color: AppColors.primaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: CustomText.customSizedText(
                            text: 'Apply pandapro voucher',
                            size: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              appDivider(thickness: 10, color: AppColors.lightGreyColor),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: AppColors.primaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: CustomText.customSizedText(
                            text: 'Payment method',
                            size: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          
                        },
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.add,
                              color: AppColors.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: CustomText.customSizedText(
                                text: 'Add a payment method',
                                size: 14,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: AppColors.white,
            padding: const EdgeInsets.all(15),
            height: 121,
            child: Column(
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
                      text: 'Rs. $subsPrice',
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w900,
                      maxLine: 1,
                      size: 16,
                    ),
                  ],
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
                          text: 'Confirm and subscribe',
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
