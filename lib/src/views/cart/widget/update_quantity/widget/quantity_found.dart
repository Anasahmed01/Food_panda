import 'package:flutter/material.dart';
import '../../../../../models/order_detail.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../order_details/order_details_viewmodel.dart';
import '../../../../order_details/widget/widget.dart';

Widget quantityFound(
    {required BuildContext context,
    required OrderDetailViewModel viewModel,
    required String requireditem,
    required double productPrice,
    required String productName,
    required String productImage,
    required Datum model}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.customSizedText(
                  text: productName,
                  maxLine: 2,
                  size: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor),
              CustomText.customSizedText(
                  text: 'Rs. $productPrice',
                  size: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor),
            ],
          ),
          CustomText.customSizedText(
              text: '${requireditem}',
              maxLine: 3,
              size: 12,
              color: Colors.black45),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              thickness: 1,
              color: AppColors.lightGreyColor,
            ),
          ),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.customSizedText(
                  text: 'Add ons.',
                  size: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.blackColor),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: CustomText.customSizedText(
                    text: 'optional',
                    size: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.blackColor),
              ),
            ],
          ),
          CustomText.customSizedText(
              text: 'Select up to 8',
              size: 12,
              fontWeight: FontWeight.w800,
              color: AppColors.greyColor),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewModel.isSelected.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          activeColor: AppColors.primaryColor,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          value: viewModel.isChecked[index],
                          onChanged: (value) {
                            viewModel.isChecked[index] = value!;
                            viewModel.rebuildUi();
                          },
                        ),
                        CustomText.customSizedText(
                            text: viewModel.optionalItem[index],
                            size: 14,
                            color: AppColors.blackColor),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CustomText.customSizedText(
                          text: '+ Rs. ${viewModel.optionalItemPrice[index]}',
                          size: 14,
                          color: AppColors.blackColor),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: AppColors.lightGreyColor,
          ),
          CustomText.customSizedText(
              text: 'Special instructions',
              size: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.blackColor),
          CustomText.customSizedText(
              text:
                  'Please let us know if you are allergic to anyting or if we need to avoide anything',
              size: 12,
              maxLine: 2,
              fontWeight: FontWeight.w800,
              color: AppColors.greyColor),
          const SizedBox(
            height: 20,
          ),
          feedbackField(),
          const SizedBox(
            height: 20,
          ),
          CustomText.customSizedText(
              text: 'If this product is not available',
              size: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.blackColor),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              bottomSheetX(context, viewModel);
              viewModel.rebuildUi();
              viewModel.notifyListeners();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blackColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.customSizedText(
                      text: 'Call me & Confirm',
                      size: 14,
                      maxLine: 2,
                      fontWeight: FontWeight.w800,
                      color: AppColors.greyColor),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future bottomSheetX(BuildContext context, OrderDetailViewModel viewModel) {
  return showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) {
      return Container(
        color: AppColors.white,
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        height: 300,
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: viewModel.bottomSheetIsSelected.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Radio(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                      ),
                      activeColor: AppColors.primaryColor,
                      value: index,
                      groupValue: viewModel.bottomSheetIsSelected.indexOf(true),
                      onChanged: (int? value) {
                        viewModel.rebuildUi();
                        for (int i = 0;
                            i < viewModel.bottomSheetIsSelected.length;
                            i++) {
                          viewModel.bottomSheetIsSelected[i] = (value == i);
                        }
                        viewModel.rebuildUi();
                      },
                    ),
                    CustomText.customSizedText(
                        text: viewModel.bottomSheetItem[index]),
                  ],
                );
              },
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(left: 8, top: 15, right: 8),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor),
                child: Center(
                  child: CustomText.customSizedText(
                      text: 'Apply', color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
