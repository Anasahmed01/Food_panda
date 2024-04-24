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
            title: GestureDetector(
              onTap: () => viewModel.navigateToBack(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      CupertinoIcons.xmark,
                      size: 20,
                      color: AppColors.primaryColor,
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
        );
      },
    );
  }
}
