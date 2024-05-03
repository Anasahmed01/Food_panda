import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/reuseable_widget/app_textfield.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/drawer/drawer.dart';
import 'package:foodpanda/src/views/home/widget/found.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getCategory();
        viewModel.getRestaurant();
      },
      builder: (context, viewModel, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) => false,
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            drawer: appDrawer(),
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              iconTheme: IconThemeData(color: AppColors.white),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.customSizedText(
                    text: 'MoneyGram',
                    size: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText.customSizedText(
                    text: 'Karachi',
                    size: 14,
                    color: AppColors.white,
                  ),
                ],
              ),
              actions: [
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.favorite_border_rounded),
                      GestureDetector(
                          onTap: () {
                            viewModel.navigateToCartView();
                          },
                          child: Badge(
                            backgroundColor: AppColors.white,
                            alignment: Alignment.bottomRight,
                            label: Text(
                              '${cart.length}',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            child: const Icon(Icons.shopping_bag_outlined),
                          )),
                    ],
                  ),
                )
              ],
            ),
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: AppColors.primaryColor,
                    automaticallyImplyLeading: false,
                    title: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 10, left: 15),
                      child: CustomTextFields.appTextField(
                        hintText: 'Search for shops & restaurants',
                        height: 45,
                        prefixIcon: Icons.search_rounded,
                      ),
                    ),
                  )
                ];
              },
              body: homeFound(context, viewModel, viewModel.getCatData!,
                  viewModel.getResData!),
            ),
          ),
        );
      },
    );
  }
}
