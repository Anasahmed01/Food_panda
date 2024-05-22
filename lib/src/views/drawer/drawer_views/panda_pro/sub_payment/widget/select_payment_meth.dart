import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/sub_payment/sub_payment_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SelectPymentMethodView extends StatelessWidget {
  const SelectPymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SubscriptionViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
              ontap: () => viewModel.navigateToBack(),
              title: 'Select a payment method',
              icon: Icons.arrow_back),
          body: Container(),
        );
      },
    );
  }
}
