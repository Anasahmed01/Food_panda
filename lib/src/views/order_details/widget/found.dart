import 'package:flutter/material.dart';
import 'package:foodpanda/src/models/order_detail.dart';
import 'package:foodpanda/src/views/order_details/widget/bottom_sheet.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../order_details_viewmodel.dart';
import 'widget.dart';

Widget found({
  required BuildContext context,
  required OrderDetailViewModel viewModel,
  required String productDiscription,
  required double productPrice,
  required String productName,
  required Datum model,
}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: CustomText.customSizedText(
                      text: model.productName,
                      maxLine: 2,
                      size: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor),
                ),
                Flexible(
                  flex: 2,
                  child: CustomText.customSizedText(
                      text: 'form Rs. ${(productPrice).toStringAsFixed(2)}',
                      size: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor),
                ),
              ],
            ),
          ),
          CustomText.customSizedText(
              text: productDiscription,
              maxLine: 3,
              size: 14,
              color: Colors.black45),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              thickness: 1,
              color: AppColors.lightGreyColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 240),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.greyColor)),
            padding: const EdgeInsets.symmetric(
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.customSizedText(
                          text: 'Choose Your Item',
                          maxLine: 1,
                          size: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blackColor),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: viewModel.required == true
                              ? AppColors.white
                              : AppColors.primaryColor,
                        ),
                        child: CustomText.customSizedText(
                          text: viewModel.required == true
                              ? 'Complete'
                              : 'Required',
                          size: 12,
                          fontWeight: FontWeight.w700,
                          color: viewModel.required == true
                              ? AppColors.blackColor
                              : AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 15),
                  child: CustomText.customSizedText(
                      text: 'Select one',
                      size: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryColor),
                ),
                ListView.builder(
                  itemCount: model.requideItems.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final softDrink = viewModel.softDrinks[index];
                    return RadioListTile<String>(
                      activeColor: AppColors.primaryColor,
                      contentPadding: const EdgeInsets.only(left: 5),
                      value: softDrink,
                      groupValue: viewModel.selectedValue,
                      onChanged: (value) {
                        viewModel.rebuildUi();
                        viewModel.selectedValue = value;
                        print(viewModel.selectedValue);
                        viewModel.rebuildUi();
                        viewModel.required = true;
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.customSizedText(
                              text: model.requideItems[index].coldDrink),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CustomText.customSizedText(text: 'Free'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
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
            thickness: 1,
            color: AppColors.lightGreyColor,
          ),
          CustomText.customSizedText(
              text: 'Special instructions',
              size: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.blackColor),
          const SizedBox(
            height: 5,
          ),
          CustomText.customSizedText(
              text:
                  'Please let us know if you are allergic to anyting or if we need to avoide anything',
              size: 14,
              maxLine: 2,
              fontWeight: FontWeight.w800,
              color: AppColors.greyColor),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: feedbackField(),
          ),
          CustomText.customSizedText(
              text: 'If this product is not available',
              size: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.blackColor),
          const SizedBox(
            height: 15,
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
                      text: viewModel
                          .bottomSheetItem[viewModel.bottomSheetIsSelectedItem],
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
      return const ModelBottomSheet();
    },
  );
}
