import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/auth/sign_in_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'widget/widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.59,
                width: MediaQuery.sizeOf(context).width * 0.59,
                child: Image.asset(AppImages.splashImage),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  height: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                          text: 'Sign up or Log in',
                          fontWeight: FontWeight.w900,
                          size: 22),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText.customSizedText(
                        text: 'Selected your preferred method to continue',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () => viewModel.signIn(),
                        child: socialButton(
                            color: AppColors.white,
                            icon: Image.asset(
                              AppImages.google,
                              height: 50,
                              width: 50,
                            ),
                            text: 'Continue With Google',
                            textColor: Colors.black54),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      socialButton(
                          color: AppColors.facebookColor.withOpacity(0.9),
                          icon: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Icon(
                              Icons.facebook_rounded,
                              color: AppColors.white,
                              size: 30,
                            ),
                          ),
                          text: 'Continue With Facebook',
                          textColor: AppColors.white),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: appDivider(
                                  thickness: 1,
                                  color: AppColors.lightGreyColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: CustomText.customSizedText(
                                  text: 'or', color: AppColors.greyColor),
                            ),
                            Flexible(
                              child: appDivider(
                                  thickness: 1,
                                  color: AppColors.lightGreyColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 8, bottom: 8),
                              child: Icon(
                                Icons.email_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            CustomText.customSizedText(
                                text: 'Continue With email',
                                fontWeight: FontWeight.w900,
                                color: Colors.black54),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
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
