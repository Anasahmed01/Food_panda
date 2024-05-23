import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../../order_details/order_details_viewmodel.dart';

class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderDetailViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(15),
          height: 240,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                child: CustomText.customSizedText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    size: 14,
                    maxLine: 5),
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

Future discoverBottomSheetX(
  BuildContext context,
) {
  return showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) {
      return const ModelBottomSheet();
    },
  );
}
