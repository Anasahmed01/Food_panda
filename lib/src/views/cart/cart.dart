import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/text/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'widget/found.dart';

class CartView extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productDiscription;
  final String image;
  const CartView(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.image,
      required this.productDiscription});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
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
                    image,
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
                  productPrice: productPrice),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomText.customSizedText(
                      text: '5', color: AppColors.blackColor),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    )),
                GestureDetector(
                  onTap: () {},
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