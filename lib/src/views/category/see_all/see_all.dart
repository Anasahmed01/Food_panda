import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/category/category_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import 'widget/found.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CategoryViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                viewModel.navigateToBack();
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.white,
              ),
            ),
            title: CustomText.customSizedText(
              text: 'Delivery Fee Savers',
              fontWeight: FontWeight.w800,
              size: 18,
              color: AppColors.white,
              maxFontSize: 18,
            ),
          ),
          body: seeAllFound(viewModel),
        );
      },
    );
  }
}
