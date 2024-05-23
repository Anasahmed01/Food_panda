import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/panda_pro_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../reuseable_widget/app_bar.dart';
import 'widget/widget.dart';

class PandaProView extends StatelessWidget {
  const PandaProView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PandaProViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
            ontap: () => viewModel.navigateToBack(),
            title: 'pandapro',
            icon: Icons.arrow_back,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 0, right: 15),
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
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText.customSizedText(
                                          text: 'pandapro',
                                          color: AppColors.primaryColor,
                                          textAlign: TextAlign.start,
                                          size: 16,
                                          fontWeight: FontWeight.w800),
                                      CustomText.customSizedText(
                                        text:
                                            'Explore exclusive perks with pandapro',
                                        fontWeight: FontWeight.w900,
                                        textAlign: TextAlign.start,
                                        maxLine: 3,
                                        size: 26,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText.customSizedText(
                                        text:
                                            'The only plan you need for free deliveries, discount, and more!',
                                        color: AppColors.primaryColor,
                                        textAlign: TextAlign.start,
                                        maxLine: 2,
                                        size: 14,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 27.0),
                                    child: Image.asset(
                                      AppImages.dinInPanda,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: AppColors.primaryColor.withOpacity(0.1),
                        leading: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.discount,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        title: CustomText.customSizedText(
                          text:
                              'Use code PROCLUB100 to get pandapro FREE for 1-month!',
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryColor,
                          textAlign: TextAlign.start,
                          maxLine: 2,
                          size: 14,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: CustomText.customSizedText(
                            text:
                                'For new pandapro subscribers only. Card payment only.',
                            color: AppColors.primaryColor,
                            textAlign: TextAlign.start,
                            maxLine: 2,
                            size: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                        child: CustomText.customSizedText(
                            text: 'Monthly perks',
                            textAlign: TextAlign.start,
                            size: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      ListView.builder(
                        itemCount: viewModel.monthlyPerkSubTitleData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: pandaProListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AppImages.delivery),
                              ),
                              title: viewModel.monthlyPerkTitleData[index],
                              subtitle:
                                  viewModel.monthlyPerkSubTitleData[index],
                            ),
                          );
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: CustomText.customSizedText(
                          text: 'See benifit details',
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w900,
                          size: 16,
                          maxFontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: CustomText.customSizedText(
                            text: 'Save up to Rs. 2,500 and more!',
                            size: 18,
                            maxLine: 2,
                            fontWeight: FontWeight.w800,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightLightGreyColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                        text: 'Frequantly Asked Questions',
                        size: 18,
                        maxLine: 2,
                        fontWeight: FontWeight.w800,
                        color: AppColors.blackColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      pandaProExpTile(
                        title: 'What is pandapro?',
                        subTitle:
                            "You agree and acknowledge that, as part of foodpanda’s policy and/or whenever it is deemed necessary, foodpanda and/or any third party engaged by foodpanda, may conduct Background Checks on you on an ongoing basis, without further reference or notice to you.",
                      ),
                      pandaProExpTile(
                        title: 'How do i use my pandapro perks?',
                        subTitle:
                            "You agree and acknowledge that, as part of foodpanda’s policy and/or whenever it is deemed necessary, foodpanda and/or any third party engaged by foodpanda, may conduct Background Checks on you on an ongoing basis, without further reference or notice to you.",
                      ),
                      pandaProExpTile(
                        title: 'When can i enjoy my pandapro perks?',
                        subTitle:
                            "You agree and acknowledge that, as part of foodpanda’s policy and/or whenever it is deemed necessary, foodpanda and/or any third party engaged by foodpanda, may conduct Background Checks on you on an ongoing basis, without further reference or notice to you.",
                      ),
                      pandaProExpTile(
                        title: 'What are surprise perks?',
                        subTitle:
                            "You agree and acknowledge that, as part of foodpanda’s policy and/or whenever it is deemed necessary, foodpanda and/or any third party engaged by foodpanda, may conduct Background Checks on you on an ongoing basis, without further reference or notice to you.",
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(
                              Uri.parse(
                                  "https://www.foodpanda.pk/contents/subscription-faq"),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: CustomText.customSizedText(
                              text: 'See all FAQs',
                              size: 16,
                              maxLine: 2,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      appDivider(
                          thickness: 1,
                          color: AppColors.greyColor.withOpacity(0.3)),
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'Subscription automatically renews at the end of your plan. Check out the ',
                              style: TextStyle(color: AppColors.blackColor)),
                          TextSpan(
                            text: 'terms and conditions.',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(
                                    Uri.parse(
                                        "https://www.foodpanda.pk/contents/terms-and-conditions.htm"),
                                    mode: LaunchMode.externalApplication);
                              },
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                        text: 'Starting from',
                        color: AppColors.blackColor,
                        maxLine: 1,
                        size: 12,
                      ),
                      CustomText.customSizedText(
                        text: 'Rs. 166.58/mo.',
                        fontWeight: FontWeight.w900,
                        maxLine: 1,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      pandaProbottomSheetX(context);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 4,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor),
                      child: Center(
                        child: CustomText.customSizedText(
                            text: 'Select plan',
                            fontWeight: FontWeight.w800,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
