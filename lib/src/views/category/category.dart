// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:stacked/stacked.dart';
import 'package:foodpanda/src/views/category/category_viewmodel.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../reuseable_widget/app_textfield.dart';
import '../../utils/colors/app_colors.dart';
import 'widget/category_found.dart';

class CategoryView extends StatelessWidget {
  final String categoryName;
  const CategoryView({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CategoryViewModel(),
      onViewModelReady: (viewModel) => viewModel.getRes(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  viewModel.navigateToBack();
                },
                child: const Icon(Icons.arrow_back)),
            backgroundColor: AppColors.white,
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.customSizedText(
                  text: 'MoneyGram',
                  size: 18,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
                CustomText.customSizedText(
                  text: categoryName,
                  size: 14,
                  color: AppColors.blackColor,
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () => viewModel.navigateToFavouriteView(),
                        child: Badge(
                            offset: const Offset(5, 2),
                            backgroundColor: AppColors.white,
                            alignment: Alignment.bottomRight,
                            label: Text(
                              '${favourite.length}',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            child: const Icon(Icons.favorite_border_rounded))),
                    InkWell(
                        onTap: () {
                          viewModel.navigateToCartView();
                        },
                        child: Badge(
                          offset: const Offset(5, 2),
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
                  backgroundColor: AppColors.white,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, right: 10, left: 15),
                    child: CustomTextFields.appTextField(
                      hintText: 'Search for restaurants & cuisines',
                      height: 45,
                      prefixIcon: Icons.search_rounded,
                    ),
                  ),
                )
              ];
            },
            body: categoryFound(viewModel, viewModel.getResData!),
          ),
        );
      },
    );
  }
}
