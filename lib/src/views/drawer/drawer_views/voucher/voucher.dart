import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/voucher/voucher_viewmodel.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/voucher/widget/widget.dart';
import 'package:stacked/stacked.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => VoucherViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.lightLightGreyColor,
          appBar: appAppbar(
              ontap: () => viewModel.navigateToBack(),
              title: 'Vouchers & offers',
              icon: Icons.arrow_back),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGreyColor),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText.customSizedText(
                                      text: 'Rs. 0.00',
                                      size: 18,
                                      fontWeight: FontWeight.w900),
                                  CustomText.customSizedText(
                                      text: 'saved this month',
                                      color: AppColors.greyColor,
                                      size: 12),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 50,
                              width: 1,
                              color: AppColors.lightGreyColor,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.tickets,
                                  color: AppColors.primaryColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: CustomText.customSizedText(
                                    text: 'Add a Voucher',
                                    size: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      voucherContainer(),
                      const SizedBox(
                        height: 15,
                      ),
                      voucherContainer(),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                appDivider(
                  thickness: 10,
                  color: AppColors.greyColor.withOpacity(0.3),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightLightGreyColor.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: CustomText.customSizedText(
                            text: 'Discover more restaurant deals',
                            size: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                          itemCount: viewModel.dealImages.length,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  viewModel.dealImages[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: CustomText.customSizedText(
                            text: 'Discover more shopping deals',
                            size: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                          reverse: true,
                          itemCount: viewModel.dealImages.length,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  viewModel.dealImages[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                appDivider(
                  thickness: 10,
                  color: AppColors.greyColor.withOpacity(0.3),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: CustomText.customSizedText(
                    text: 'Refer a friend',
                    size: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.lightGreyColor),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGreyColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: Image.asset(
                            AppImages.dinInPanda,
                            height: 60,
                            width: 80,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.customSizedText(
                              text: 'Refer friend and get Rs. 350.00',
                              size: 16,
                              maxLine: 2,
                              fontWeight: FontWeight.w900,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: CustomText.customSizedText(
                                text: 'Find out how',
                                color: AppColors.white,
                                size: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
