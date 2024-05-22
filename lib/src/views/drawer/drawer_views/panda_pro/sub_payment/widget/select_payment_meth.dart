import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/sub_payment/sub_payment_viewmodel.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/widget/widget.dart';
import 'package:stacked/stacked.dart';

class SelectPymentMethodView extends StatelessWidget {
  const SelectPymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SubscriptionViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
              ontap: () => viewModel.navigateToBack(),
              title: 'Select a payment method',
              icon: Icons.arrow_back),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  tileColor: Colors.amber[50],
                  leading:
                      const Icon(CupertinoIcons.exclamationmark_triangle_fill),
                  title: CustomText.customSizedText(
                    textAlign: TextAlign.start,
                    size: 12,
                    text:
                        'Select another payment method to complete your payment',
                    maxLine: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: AppColors.greyColor,
                ),
                title: CustomText.customSizedText(
                    text: 'Credit or Debit Card', fontWeight: FontWeight.w800),
                subtitle: Row(
                  children: [
                    cardContainer(
                        color: AppColors.blackColor,
                        image: AppImages.mastercard),
                    cardContainer(
                        color: AppColors.white, image: AppImages.visa),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor),
              child: Center(
                child: CustomText.customSizedText(
                    text: 'Confirm',
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
