import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/order_details/order_details_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../models/order_detail.dart';
import 'widget/found.dart';

class OrderDetailView extends StatelessWidget {
  final String deliveryType;
  final String deliveryPrice;
  final String discountText;
  final String resturantImage;
  final String resturantRating;
  final String productName;
  final String resturantName;
  final String deliveryTime;
  final double productPrice;
  final String productDiscription;
  final String productImage;
  final int productId;
  final Datum model;
  const OrderDetailView({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDiscription,
    required this.model,
    required this.resturantName,
    required this.deliveryTime,
    required this.productId,
    required this.deliveryType,
    required this.deliveryPrice,
    required this.discountText,
    required this.resturantImage,
    required this.resturantRating,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderDetailViewModel(),
      onViewModelReady: (viewModel) => viewModel.getRes(),
      builder: (context, viewModel, child) {
        // var cartData = [
        //   productName,
        //   deliveryTime,
        //   productPrice,
        //   productImage,
        //   resturantName,
        //   productId,
        //   viewModel.selectedValue,
        //   viewModel.quantity
        // ];
        var cartData = {
          "product_name": productName,
          "delivery_time": deliveryTime,
          "product_price": productPrice,
          "product_image": productImage,
          "resturant_name": resturantName,
          "product_id": productId,
          "required_item": viewModel.selectedValue,
          "quantity": viewModel.quantity
        };

        // Datum cartData = Datum(
        //   productName: productName,
        //   productImage: productImage,
        //   productPrice: productPrice,
        //   discription: 'discription',
        //   requideItems: [],
        //   optionalItem: [],
        // );

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
              found(
                context: context,
                viewModel: viewModel,
                productDiscription: productDiscription,
                productName: productName,
                productPrice: productPrice,
                model: model,
              ),
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
                    ),
                  ),
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
                          viewModel.navigateToResDetailView(
                              deliveryPrice: deliveryPrice,
                              deliveryTime: deliveryTime,
                              deliveryType: deliveryType,
                              discountText: discountText,
                              resturantImage: resturantImage,
                              resturantName: resturantName,
                              resturantRating: resturantRating);

                          viewModel.addToCart(cartData: cartData);
                          viewModel.rebuildUi();
                          print(cart.length);
                        }
                      : () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 8, top: 15, right: 8, bottom: 10),
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: viewModel.required == true
                            ? AppColors.primaryColor
                            : AppColors.greyColor),
                    child: Center(
                      child: CustomText.customSizedText(
                          text: 'Add to cart', color: AppColors.white),
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
