import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/views/category/widget/card.dart';
import 'package:foodpanda/src/views/discover_res/discover_res_viewmodel.dart';
import 'package:foodpanda/src/views/discover_res/widget/bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../utils/colors/app_colors.dart';

class DiscoverRestaurantView extends StatelessWidget {
  final String productImage;
  const DiscoverRestaurantView({super.key, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DiscoverRestaurantViewModel(),
      onViewModelReady: (viewModel) => viewModel.getRes(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                      height: 325,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              productImage,
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 280, right: 15, left: 15),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              // contentPadding: EdgeInsets.zero,
                              tileColor: AppColors.white,
                              selectedTileColor: AppColors.white,
                              title: CustomText.customSizedText(
                                  text: 'Campaign info',
                                  fontWeight: FontWeight.w800,
                                  size: 16),
                              trailing: InkWell(
                                onTap: () {},
                                child: InkWell(
                                  onTap: () => discoverBottomSheetX(context),
                                  child: SizedBox(
                                    width: 95,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText.customSizedText(
                                            text: 'Read more',
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w900),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: AppColors.primaryColor,
                                            size: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              leading: Icon(
                                Icons.info_outline_rounded,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                expandedHeight: 325,
                title: GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white),
                    child: Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: viewModel.popularResImg.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                          onTap: () {
                            viewModel.navigateToResturantDetailView(
                                resturantRating: viewModel
                                    .getResData!.data[index].restaurantsRating,
                                resturantImage: viewModel
                                    .getResData!.data[index].restaurantsImage,
                                deliveryType: viewModel
                                    .getResData!.data[index].runtimeType
                                    .toString(),
                                deliveryPrice: viewModel
                                    .getResData!.data[index].minimumPrice,
                                resturantName: viewModel
                                    .getResData!.data[index].restaurantsName,
                                deliveryTime: viewModel
                                    .getResData!.data[index].deliveryTime,
                                discountText:
                                    viewModel.getResData!.data[index].discount);
                          },
                          child: deliveryContainer(
                              context, index, viewModel.getResData!)),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
