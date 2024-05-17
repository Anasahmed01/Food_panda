import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/order_details/order_details_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderDetailViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          color: AppColors.white,
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
          height: 325,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                child: CustomText.customSizedText(
                    text: 'If this product is not available',
                    size: 20,
                    fontWeight: FontWeight.w800),
              ),
              ListView.builder(
                itemCount: viewModel.bottomSheetItem.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    activeColor: AppColors.primaryColor,
                    contentPadding: const EdgeInsets.only(left: 5),
                    value: index,
                    groupValue: viewModel.bottomSheetIsSelectedItem,
                    onChanged: (int? value) {
                      viewModel.rebuildUi();
                      viewModel.bottomSheetIsSelectedItem = value!;
                      print(viewModel.selectedValue.toString());
                      viewModel.rebuildUi();
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.customSizedText(
                            text: viewModel.bottomSheetItem[index]),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: CustomText.customSizedText(text: 'Free'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  viewModel.navigateToBack();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 8, top: 15, right: 8),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Center(
                    child: CustomText.customSizedText(
                      text: 'Apply',
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
