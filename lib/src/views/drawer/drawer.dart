import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.primaryColor,
                          height: MediaQuery.of(context).size.height / 3.8,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height / 32,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.pandaMart1),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomText.customSizedText(
                                  text: 'Jhon Doe',
                                  size: 22,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
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
                          icon: Icons.help_outline,
                          onTap: () {},
                        ),
                        listTile(
                          title: 'foodpanda for business',
                          icon: Icons.business_rounded,
                          onTap: () {},
                        ),
                        Divider(
                          thickness: 2,
                          color: AppColors.lightGreyColor,
                        ),
                        listTile(
                          title: 'Settings',
                          isIcon: false,
                          onTap: () {},
                        ),
                        listTile(
                          title: 'Terms & Conditions / Privacy.',
                          isIcon: false,
                          onTap: () {},
                        ),
                        listTile(
                          title: 'Logout',
                          isIcon: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      );
    },
  );
}
