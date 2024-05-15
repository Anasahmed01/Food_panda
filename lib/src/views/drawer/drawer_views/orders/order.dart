import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/orders/order_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
              ontap: () => viewModel.navigateToBack(),
              title: 'Orders',
              icon: CupertinoIcons.xmark),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.content_paste_search_sharp,
                  size: 100,
                  color: AppColors.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: CustomText.customSizedText(
                      text: 'No orders yet',
                      size: 24,
                      fontWeight: FontWeight.w700),
                ),
                CustomText.customSizedText(
                    text: "Hungary? Place an order and it'll show here.",
                    size: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
