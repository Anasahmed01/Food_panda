import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/checkout/checkout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
