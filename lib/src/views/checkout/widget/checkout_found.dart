import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/views/checkout/checkout_viewmodel.dart';
import '../../../reuseable_widget/app_button.dart';
import '../../../reuseable_widget/app_divider.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/images.dart';

Widget checkoutFound(
    {required CheckoutViewModel viewModel, required double totalPrice}) {
  return Padding(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    CustomText.customSizedText(text: 'Karachi', size: 15),
                  ],
                ),
              ),
              appDivider(color: AppColors.lightGreyColor, thickness: 1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                    CustomText.customSizedText(
                        text: '  Add delivery instruction for your rider',
                        fontWeight: FontWeight.w800,
                        size: 14,
                        color: AppColors.primaryColor),
                  ],
                ),
              ),
              appDivider(color: AppColors.lightGreyColor, thickness: 1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
          margin: const EdgeInsets.only(bottom: 15, top: 10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGreyColor),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  top: 15,
                ),
                child: Row(
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
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15, bottom: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomText.customSizedText(
                            text: '${cart[index][0]}',
                            size: 14,
                          ),
                        ),
                        Flexible(
                          child: CustomText.customSizedText(
                            text: 'Rs. ${cart[index][2]}',
                            size: 14,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              appDivider(thickness: 1, color: AppColors.lightGreyColor),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomText.customSizedText(
                            color: Colors.black87,
                            text: 'Subtotal',
                            size: 14,
                          ),
                        ),
                        Flexible(
                          child: CustomText.customSizedText(
                            color: Colors.black87,
                            text: 'Rs. $totalPrice',
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomText.customSizedText(
                              color: Colors.black87,
                              text: 'Standard delivery',
                              size: 14,
                            ),
                          ),
                          Flexible(
                            child: CustomText.customSizedText(
                              color: Colors.black87,
                              text: '106.19',
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomText.customSizedText(
                            color: Colors.black87,
                            text: 'Platform Fee',
                            size: 14,
                          ),
                        ),
                        Flexible(
                          child: CustomText.customSizedText(
                            color: Colors.black87,
                            text: 'Rs. 8.80',
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.customSizedText(
                            text: 'VAT',
                            maxLine: 1,
                            size: 14,
                          ),
                          CustomText.customSizedText(
                            text: 'Rs. 102.05',
                            maxLine: 1,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
              text: 'By completing this order, I agree to all ',
              children: <InlineSpan>[
                TextSpan(
                  text: 'terms & conditions.',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ]),
        ),
      ],
    ),
  );
}
