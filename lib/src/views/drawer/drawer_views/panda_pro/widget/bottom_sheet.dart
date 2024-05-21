import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/panda_pro_viewmodel.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/widget/widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

class PandaProBottomSheet extends StatelessWidget {
  const PandaProBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PandaProViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(15),
          height: 380,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomText.customSizedText(
                  text: 'Select plan', fontWeight: FontWeight.w900, size: 20),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () => viewModel.selectIndex(0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: viewModel.seletedContiner == 0
                                            ? AppColors.primaryColor
                                            : AppColors.greyColor
                                                .withOpacity(0.3),
                                      ),
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        pandaproDisContainer(
                                          text: '1 month',
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Column(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Rs. ',
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: '249.00',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: ' /mo.',
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomText.customSizedText(
                                                text:
                                                    'Rs. 249.00\nbilled every month',
                                                textAlign: TextAlign.start,
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.w600,
                                                maxFontSize: 14,
                                                minFontSize: 14,
                                                size: 14,
                                                maxLine: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 7.0, top: 5),
                                child: Icon(
                                  Icons.check_circle_sharp,
                                  color: viewModel.seletedContiner == 0
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                      child: planContainer(
                          index: 1,
                          viewModel: viewModel,
                          context: context,
                          discountPercent: 'SAVE 60%',
                          month: '6',
                          discountPrice: '99.83',
                          price: '599.00')),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                      child: planContainer(
                          index: 2,
                          viewModel: viewModel,
                          context: context,
                          discountPercent: 'SAVE 34%',
                          month: '12',
                          discountPrice: '166.58',
                          price: '1,999.00')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              appDivider(thickness: 1, color: AppColors.lightGreyColor),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => viewModel.navigateToBack(),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Center(
                    child: CustomText.customSizedText(
                        text: 'SUBSCRIBE NOW',
                        fontWeight: FontWeight.w800,
                        color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget planContainer(
      {required BuildContext context,
      required String discountPrice,
      required int index,
      required String discountPercent,
      required String price,
      required PandaProViewModel viewModel,
      required String month}) {
    return InkWell(
      onTap: () => viewModel.selectIndex(index),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: CustomText.customSizedText(
                        text: discountPercent,
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                        minFontSize: 12,
                        size: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: viewModel.seletedContiner == index
                              ? AppColors.primaryColor
                              : AppColors.greyColor.withOpacity(0.3)),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        pandaproDisContainer(
                          text: '$month months',
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Rs. ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: discountPrice,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' /mo.',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText.customSizedText(
                                text: 'Rs. $price\nbilled every $month month',
                                textAlign: TextAlign.start,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                maxFontSize: 14,
                                minFontSize: 14,
                                size: 14,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 7.0, top: 5),
                child: Icon(
                  Icons.check_circle_sharp,
                  color: viewModel.seletedContiner == index
                      ? AppColors.primaryColor
                      : AppColors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
