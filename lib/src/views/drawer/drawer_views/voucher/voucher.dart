import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/voucher/voucher_viewmodel.dart';
import 'package:stacked/stacked.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => VoucherViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
