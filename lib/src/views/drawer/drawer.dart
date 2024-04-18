import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/drawer/drawer_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../reuseable_widget/text/custom_text.dart';
import '../../utils/colors/app_colors.dart';
import 'widget/drawer_tile.dart';

Widget appDrawer() {
  return ViewModelBuilder.reactive(
    viewModelBuilder: () => DrawerViewModel(),
    builder: (context, viewModel, child) {
      return SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Drawer(
          surfaceTintColor: AppColors.blackColor,
          backgroundColor: AppColors.white.withOpacity(0.9),
          shadowColor: AppColors.blackColor.withOpacity(0.9),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: AnimationLimiter(
                child: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Container(
                                color: AppColors.primaryColor,
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(AppImages.pandaMart1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: CustomText.customSizedText(
                                  text: 'Jhon',
                                  size: 22,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  listTile(
                                    title: 'Become a pandapro',
                                    icon: Icons.polymer_rounded,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'Vouchers & offers',
                                    icon: CupertinoIcons.ticket,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'Favourites',
                                    icon: CupertinoIcons.heart,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'Orders & recordering',
                                    icon: Icons.receipt_long_sharp,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'View profile',
                                    icon: CupertinoIcons.person,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'Addresses',
                                    icon: Icons.location_on_outlined,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'panda rewards',
                                    icon: Icons.workspace_premium_sharp,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'Help center',
                                    icon: Icons.headset_mic_outlined,
                                    onTap: () {},
                                  ),
                                  listTile(
                                    title: 'Logout',
                                    icon: Icons.logout_outlined,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      );
    },
  );
}
