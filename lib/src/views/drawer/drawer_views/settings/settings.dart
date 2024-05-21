import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../../utils/colors/app_colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.lightLightGreyColor,
          appBar: appAppbar(
              ontap: () => viewModel.navigateToBack(),
              title: 'Settings',
              icon: Icons.arrow_back),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0.1,
                        offset: const Offset(0, 0),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.customSizedText(
                              text: 'Language', color: AppColors.greyColor),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText.customSizedText(
                              text: 'Edit',
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: CustomText.customSizedText(
                            text: 'English',
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w900,
                            size: 18),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: viewModel.settings.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 2.0,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 0.1,
                            offset: const Offset(0, 0),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: CheckboxListTile(
                        activeColor: AppColors.primaryColor,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: viewModel.isChecked[index],
                        onChanged: (value) {
                          viewModel.isChecked[index] = value!;
                          viewModel.rebuildUi();
                        },
                        visualDensity: VisualDensity.standard,
                        title: CustomText.customSizedText(
                            text: viewModel.settings[index], size: 15),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText.customSizedText(
                    text: 'Version 24.8.0 (240800794)', size: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
