import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../del_custom_model/order_del_model.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';
import 'favourite_viewmodel.dart';
import 'widget/favourite_fond.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FavouriteViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  viewModel.navigateToHomeView();
                },
                child: const Icon(Icons.arrow_back)),
            backgroundColor: AppColors.white,
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            title: CustomText.customSizedText(
              text: 'Favourites',
              size: 18,
              fontWeight: FontWeight.w700,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkWell(
                  onTap: () {
                    viewModel.navigateToCartView();
                  },
                  child: Badge(
                    backgroundColor: AppColors.primaryColor,
                    alignment: Alignment.bottomRight,
                    label: Text(
                      '${cart.length}',
                      style: TextStyle(color: AppColors.white),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                ),
              ),
            ],
          ),
          body: favoriteFound(),
        );
      },
    );
  }
}
