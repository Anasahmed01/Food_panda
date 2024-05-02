import 'package:flutter/material.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';
import '../../../reuseable_widget/custom_text.dart';

Widget expansionTile(
    {required CartViewModel viewModel,
    required String requideItems,
    required String optionalItem,
    required BuildContext context}) {
  return Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      iconColor: AppColors.blackColor,
      tilePadding: EdgeInsets.zero,
      expandedAlignment: Alignment.topLeft,
      //enabled: true,
      title: CustomText.customSizedText(
        text: requideItems,
        maxLine: 2,
        size: 12,
      ),
      children: [
        CustomText.customSizedText(text: optionalItem),
      ],
      onExpansionChanged: (bool expanded) {
        viewModel.rebuildUi();
        viewModel.customIcon = expanded;
        viewModel.rebuildUi();
      },
    ),
  );
}
