import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodpanda/src/del_custom_model/product_detail_model.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';

Widget cartFound({
  required CartViewModel viewModel,
  required BuildContext context,
}) {
  if (cart.isEmpty) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          child: Image.asset(AppImages.emptyCart),
        ),
      ],
    );
  } else {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(8),
          height: 70,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.delivery),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.customSizedText(
                      text: 'Estimated delivery',
                      color: AppColors.greyColor,
                      size: 12),
                  // CustomText.customSizedText(
                  //     text: cart.isEmpty ? '' : 'NOW ( ${cart[0][1]} )',
                  //     size: 16,
                  //     fontWeight: FontWeight.w700),
                ],
              )
            ],
          ),
        ),
        ListView.separated(
          itemCount: cart.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            // var prices = cart[index];
            // double pp = prices.productPrice;
            // viewModel.sumPrice(pp);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        CustomText.customSizedText(text: '1'),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(cart[index].productImage),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                          text: cart[index].productName,
                          maxLine: 3,
                          size: 12,
                          maxFontSize: 12,
                          minFontSize: 12,
                          color: AppColors.primaryColor),
                      SizedBox(
                        width: 100,
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          expandedAlignment: Alignment.topLeft,
                          //enabled: true,
                          title: CustomText.customSizedText(
                            text: 'Pepsi - 345 ml',
                            maxLine: 2,
                            size: 12,
                          ),
                          trailing: Icon(viewModel.customIcon
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_outlined),

                          children: [
                            CustomText.customSizedText(
                                text: 'Next Cola - 345 ml'),
                          ],
                          onExpansionChanged: (bool expanded) {
                            viewModel.rebuildUi();
                            viewModel.customIcon = expanded;
                            viewModel.rebuildUi();
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomText.customSizedText(
                      text: 'Rs. ${cart[index].productPrice}'),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 5, bottom: 5),
                  child: Divider(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: AppColors.lightGreyColor,
          thickness: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.customSizedText(
                      text: 'Subtotal',
                      maxLine: 1,
                      size: 16,
                      fontWeight: FontWeight.w800),
                  CustomText.customSizedText(
                    text: 'Rs. ${viewModel.totalPrice}',
                    maxLine: 1,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.customSizedText(
                    text: 'Delivery Fee',
                    maxLine: 1,
                    size: 14,
                  ),
                  CustomText.customSizedText(
                    text: 'Rs. 106.19',
                    maxLine: 1,
                    size: 14,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText.customSizedText(
                        text: 'Platform Fee',
                        maxLine: 1,
                        size: 14,
                      ),
                      const Icon(Icons.info_outline_rounded),
                    ],
                  ),
                  CustomText.customSizedText(
                    text: 'Rs. 8.84',
                    maxLine: 1,
                    size: 14,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
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
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.ticket,
                    color: AppColors.primaryColor,
                  ),
                  CustomText.customSizedText(
                    text: '    Apply a voucher',
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w900,
                    maxLine: 1,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.lightGreyColor,
          thickness: 10,
        ),
      ],
    );
  }
}
