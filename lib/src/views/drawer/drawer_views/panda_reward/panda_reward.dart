import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_reward/panda_reward_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PandaRewardView extends StatelessWidget {
  const PandaRewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PandaRewardViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                // shape: const ContinuousRectangleBorder(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30),
                //     bottomRight: Radius.circular(30),
                //   ),
                // ),
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                pinned: true,
                flexibleSpace: Stack(
                  children: [
                    // FlexibleSpaceBar(
                    //   background: Image.asset(
                    //     AppImages.googleMap,
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    Positioned(
                        bottom: 5,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 130,
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText.customSizedText(
                                  text: 'Points', color: Colors.black38),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5, bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      CupertinoIcons.star_circle,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: CustomText.customSizedText(
                                          text: '0',
                                          size: 24,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.primaryColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              CustomText.customSizedText(
                                  text: 'How to earn points',
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ],
                          ),
                        ))
                  ],
                ),
                expandedHeight: MediaQuery.sizeOf(context).height / 2.5,
                title: GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.white),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      size: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: Icon(
                      Icons.help_outline_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.customSizedText(
                          text: 'Complete stamp cards to win',
                            fontWeight: FontWeight.w900,
                            size: 18),
                      ],
                    ),
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
