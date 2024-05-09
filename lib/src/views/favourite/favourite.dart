import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_scaffold.dart';
import 'package:foodpanda/src/utils/images/images.dart';
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
        if (favourite.isEmpty) {
          return appScafold(
               onBackTap: () => viewModel.navigateToBack(),
              appBarTitle: 'Favourite',
              body: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.emptyFavourite,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomText.customSizedText(
                          text: 'No favourite saved',
                          size: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: CustomText.customSizedText(
                          text:
                              "To make ordering even faster, you'll find all your faves here. Just look for the heart icon!",
                          maxLine: 2,
                          textAlign: TextAlign.center),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.navigateToHomeView(),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: CustomText.customSizedText(
                            text: "Let's find some favourite",          
                            color: AppColors.white,
                            size: 14,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ));
        }

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
