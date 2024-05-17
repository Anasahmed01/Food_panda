import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/profile/profile_viewmodel.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/profile/widget/widget.dart';
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15, top: 20, bottom: 20, right: 15),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 2.0,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 0.1,
                            offset: const Offset(0, 0),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText.customSizedText(
                              text: 'Name',
                              size: 16,
                            ),
                            Icon(
                              Icons.edit_outlined,
                              size: 26,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'John Doe',
                          fontWeight: FontWeight.w800,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  profileContainer(
                    title: 'Email',
                    subtitle: 'JohnDoe@gmail.com',
                  ),
                  profileContainer(
                    title: 'Mobile number',
                    subtitle: '+923456789101',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: CustomText.customSizedText(
                      text: 'Connected accounts',
                      fontWeight: FontWeight.w900,
                      size: 18,
                    ),
                  ),
                  profSocialButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Icon(
                          Icons.facebook_sharp,
                          size: 26,
                          color: AppColors.facebookColor.withOpacity(0.9),
                        ),
                      ),
                      socialName: 'Facebook'),
                  profSocialButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Image.asset(
                          AppImages.google,
                          height: 25,
                          width: 45,
                        ),
                      ),
                      socialName: 'Google'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
