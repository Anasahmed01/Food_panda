import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../reuseable_widget/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
            ontap: () => viewModel.navigateToBack(),
            title: 'Profile',
            icon: CupertinoIcons.xmark,
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(width: 0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.customSizedText(
                          text: 'Name',
                          fontWeight: FontWeight.w800,
                          size: 18,
                        ),
                        Icon(
                          Icons.edit_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    CustomText.customSizedText(
                      text: 'John Doe',
                      fontWeight: FontWeight.w800,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.customSizedText(
                          text: 'Email',
                          fontWeight: FontWeight.w800,
                          size: 18,
                        ),
                        Icon(
                          Icons.edit_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    CustomText.customSizedText(
                      text: 'JohnDoe@gmail.com',
                      fontWeight: FontWeight.w800,
                      size: 18,
                    ),
                    CustomText.customSizedText(
                      text: 'verifide',
                      fontWeight: FontWeight.w800,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
