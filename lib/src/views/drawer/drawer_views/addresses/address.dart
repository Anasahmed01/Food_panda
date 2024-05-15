import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/addresses/address_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../../reuseable_widget/custom_text.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AddressViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      size: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                CustomText.customSizedText(
                    text: 'Addresses', fontWeight: FontWeight.w800, size: 18),
              ],
            ),
          ),
          body: Column(
            children: [
              appDivider(thickness: 1, color: AppColors.lightGreyColor),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      activeColor: AppColors.primaryColor,
                      contentPadding: const EdgeInsets.only(left: 5),
                      value: addresses[index],
                      groupValue: viewModel.selectedValue,
                      onChanged: (value) {
                        viewModel.rebuildUi();
                        viewModel.selectedValue = value;
                        print(viewModel.selectedValue);
                        viewModel.rebuildUi();
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 5,
                            child: CustomText.customSizedText(
                                text: addresses[index]["address"],
                                maxFontSize: 15,
                                minFontSize: 15,
                                fontWeight: FontWeight.w800,
                                size: 15),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.edit_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.customSizedText(
                              text: addresses[index]["city"],
                              color: AppColors.greyColor),
                          CustomText.customSizedText(
                              text: "Note to rider: none",
                              color: AppColors.greyColor),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return appDivider(
                        thickness: 1, color: AppColors.lightGreyColor);
                  },
                  itemCount: addresses.length),
            ],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              viewModel.navigateToGoogleMapView();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor),
              child: Center(
                child: CustomText.customSizedText(
                    text: 'Add New Address',
                    fontWeight: FontWeight.w800,
                    color: AppColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
