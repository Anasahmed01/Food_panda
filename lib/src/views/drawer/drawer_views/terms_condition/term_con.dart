import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/terms_condition/term_con_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../reuseable_widget/app_bar.dart';
import '../../../../reuseable_widget/custom_text.dart';

class TermCondView extends StatelessWidget {
  const TermCondView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TermCondViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
              icon: Icons.arrow_back_outlined,
              ontap: () => viewModel.navigateToBack(),
              title: 'More'),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appDivider(thickness: 1, color: AppColors.lightGreyColor),
              InkWell(
                onTap: () {
                  launchUrl(
                      Uri.parse(
                          "https://www.foodpanda.pk/contents/terms-and-conditions.htm"),
                      mode: LaunchMode.externalApplication);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  child: CustomText.customSizedText(
                    text: 'Terms & conditions',
                    size: 16,
                  ),
                ),
              ),
              appDivider(thickness: 1, color: AppColors.lightGreyColor),
              InkWell(
                onTap: () {
                  launchUrl(
                      Uri.parse(
                          "https://www.foodpanda.pk/contents/privacy.htm"),
                      mode: LaunchMode.externalApplication);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  child: CustomText.customSizedText(
                    text: 'Data policy',
                    size: 16,
                  ),
                ),
              ),
              appDivider(thickness: 1, color: AppColors.lightGreyColor),
            ],
          ),
        );
      },
    );
  }
}
