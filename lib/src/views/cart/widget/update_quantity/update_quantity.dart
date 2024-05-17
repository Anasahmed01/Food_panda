import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/models/order_detail.dart';
import 'package:foodpanda/src/views/order_details/order_details_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../../reuseable_widget/custom_text.dart';
import '../../../../utils/colors/app_colors.dart';

class UpdateQuantity extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productPrice;
  final String requireditem;
  final Datum model;
  const UpdateQuantity(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.requireditem,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderDetailViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    productImage,
                    fit: BoxFit.fill,
                  ),
                ),
                expandedHeight: MediaQuery.sizeOf(context).height / 3.7,
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
                      CupertinoIcons.xmark,
                      size: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              // quantityFound(
              //   context: context,
              //   viewModel: viewModel,
              //   productImage: productImage,
              //   requireditem: requireditem,
              //   productName: productName,
              //   productPrice: productPrice,
              //   model: model,
              // ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: viewModel.quantity == 1
                      ? () {}
                      : () {
                          viewModel.decrement();
                          viewModel.rebuildUi();
                        },
                  child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: viewModel.quantity == 1
                              ? AppColors.greyColor
                              : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.remove,
                        color: AppColors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomText.customSizedText(
                      text: viewModel.quantity.toString(),
                      color: AppColors.blackColor),
                ),
                GestureDetector(
                  onTap: () {
                    viewModel.addQuantity();
                    viewModel.rebuildUi();
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                      )),
                ),
                GestureDetector(
                  onTap: viewModel.required == true
                      ? () {
                          // viewModel.navigateToResDetailView(
                          //     deliveryPrice: deliveryPrice,
                          //     deliveryTime: deliveryTime,
                          //     deliveryType: deliveryType,
                          //     discountText: discountText,
                          //     resturantImage: resturantImage,
                          //     resturantName: resturantName,
                          //     resturantRating: resturantRating);
                          // cart.add(cartData);
                          // print(cartData);
                        }
                      : () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 8, top: 15, right: 8, bottom: 10),
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor),
                    child: Center(
                      child: CustomText.customSizedText(
                          text: 'Update', color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
