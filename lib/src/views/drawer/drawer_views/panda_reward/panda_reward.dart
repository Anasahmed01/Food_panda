import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_divider.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
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
          backgroundColor: AppColors.primaryColor,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                surfaceTintColor: AppColors.white,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  margin: const EdgeInsets.only(
                      top: 200, bottom: 20, left: 15, right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 10,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                )),
                expandedHeight: MediaQuery.sizeOf(context).height / 2.7,
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
                  // height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.customSizedText(
                          text: 'Complete stamp cards to win',
                          fontWeight: FontWeight.w900,
                          size: 18,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 20),
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 2.0,
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 0.1,
                                  offset: const Offset(0, 0))
                            ],
                            gradient: LinearGradient(
                                stops: const [5.5, 5.90],
                                begin: Alignment.topCenter,
                                colors: [
                                  AppColors.primaryColor.withOpacity(0.1),
                                  AppColors.white,
                                ],
                                end: Alignment.center),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.customSizedText(
                                text: 'Cola Next Merch Raffle',
                                size: 12,
                              ),
                              CustomText.customSizedText(
                                  text:
                                      'Order Cola Next deals and win exclusive merch Raffle',
                                  size: 18,
                                  textAlign: TextAlign.start,
                                  maxLine: 2,
                                  fontWeight: FontWeight.w800),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Image.asset(
                                    AppImages.circlePanda,
                                    height: 80,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: AppColors.primaryColor
                                            .withOpacity(0.1)),
                                    child: Icon(
                                      CupertinoIcons.wind_snow,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText.customSizedText(
                                        text: '0 / 8',
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.primaryColor,
                                        size: 14,
                                      ),
                                      CustomText.customSizedText(
                                        text: 'orders placed',
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        appDivider(
                            thickness: 1, color: AppColors.lightGreyColor),
                        ListTile(
                          leading: const Icon(
                            Icons.stars_sharp,
                            size: 50,
                          ),
                          trailing: CustomText.customSizedText(
                            text: 'See all',
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                            size: 14,
                          ),
                          title: CustomText.customSizedText(
                            text: 'Badges',
                            fontWeight: FontWeight.w800,
                            size: 18,
                          ),
                          subtitle: CustomText.customSizedText(
                            text: 'Complete stamp cards to earn badges',
                            maxLine: 2,
                            color: AppColors.greyColor,
                            size: 12,
                          ),
                        ),
                        appDivider(
                            thickness: 1, color: AppColors.lightGreyColor),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Image.asset(AppImages.circlePanda),
                              CustomText.customSizedText(
                                text: 'Ready to win?',
                                color: Colors.black54,
                                fontWeight: FontWeight.w900,
                                size: 16,
                              ),
                              CustomText.customSizedText(
                                  text: 'Turn point into your fave rewards',
                                  fontWeight: FontWeight.w900,
                                  size: 26,
                                  textAlign: TextAlign.center,
                                  maxLine: 2),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: InkWell(
                                  onTap: () =>
                                      viewModel.navigateToTermCondView(),
                                  child: CustomText.customSizedText(
                                    text: 'Terms & conditions',
                                    color: AppColors.primaryColor,
                                    size: 14,
                                  ),
                                ),
                              ),
                              Container(
                                color: AppColors.white,
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 3 / 3.5,
                                            crossAxisSpacing: 25,
                                            mainAxisSpacing: 25),
                                    itemCount: 2,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          // alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color:
                                                  AppColors.lightLightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons.gift_fill,
                                                color: AppColors.primaryColor,
                                                size: 80,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomText.customSizedText(
                                                text: 'Voucher of',
                                                fontWeight: FontWeight.w800,
                                                size: 12,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5.0),
                                                child:
                                                    CustomText.customSizedText(
                                                  text: 'Rs 40',
                                                  fontWeight: FontWeight.w800,
                                                  size: 18,
                                                ),
                                              ),
                                              Container(
                                                width: 70,
                                                padding:
                                                    const EdgeInsets.all(6),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: AppColors.greyColor),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons
                                                          .star_circle,
                                                      size: 18,
                                                      color: AppColors.white,
                                                    ),
                                                    CustomText.customSizedText(
                                                      color: AppColors.white,
                                                      text: '400',
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      size: 14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
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
