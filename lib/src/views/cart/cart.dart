import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/text/custom_text.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../utils/colors/app_colors.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 15,
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: () => viewModel.navigateToBack(),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.xmark,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  Column(
                    children: [CustomText.customSizedText(text: 'Cart'),CustomText.customSizedText(text: 'Cart')],
                  ),
                ],
              ),
            ),
          ),
          body: Container(),
        );
      },
    );
  }
}
