// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/cat_del_model.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/del_custom_model/popular_restaurants.dart';
import 'package:foodpanda/src/models/category_data.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/cart/cart.dart';
import 'package:foodpanda/src/views/category/category.dart';
import 'package:foodpanda/src/views/resturant_detail/resturant_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../models/popular_restaurant.dart';

class HomeViewModel extends BaseViewModel {
  bool customIcon = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  navigateToCatView(categoryName) {
    locator<NavigationService>().navigateWithTransition(
      CategoryView(
        categoryName: categoryName,
      ),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.leftToRight,
      curve: Curves.ease,
    );
  }

  navigateToCartView() {
    locator<NavigationService>().navigateWithTransition(
      const CartView(),
    );
  }

  navigateToProductDetailView(
      {required String deliveryType,
      required String deliveryPrice,
      required String resturantName,
      required String deliveryTime,
      required String discountText,
      required String resturantImage,
      required String resturantRating}) {
    locator<NavigationService>().navigateWithTransition(
      ResturantDetailView(
        resturantRating: resturantRating,
        resturantImage: resturantImage,
        discountText: discountText,
        deliveryType: deliveryType,
        deliveryPrice: deliveryPrice,
        resturantName: resturantName,
        deliveryTime: deliveryTime,
      ),
      opaque: true,
      duration: const Duration(milliseconds: 100),
      transitionStyle: Transition.leftToRight,
      curve: Curves.ease,
    );
  }

  List categoryImages = [
    AppImages.pandaMart1,
    AppImages.pandaMart2,
    AppImages.pandaMart3,
    AppImages.pandaMart1,
    AppImages.pandaMart2,
    AppImages.pandaMart3,
  ];
  List dealImages = [
    AppImages.deal1,
    AppImages.deal2,
    AppImages.deal3,
    AppImages.deal4,
    AppImages.deal5,
  ];

  // Cuisines data

  List cuisinesImages = [
    AppImages.cuisines1,
    AppImages.cuisines2,
    AppImages.cuisines3,
    AppImages.cuisines4,
    AppImages.cuisines5,
  ];

  List cuisinesData = [
    'Pizza',
    'Burgers',
    'Middle Eastern',
    'Healthy food',
    'Fish rise',
  ];

  //Panda Mart data

  List pandaMartImg = [
    AppImages.pandaMart1,
    AppImages.pandaMart2,
    AppImages.pandaMart3,
    AppImages.pandaMart1,
  ];
  List pandaMartText = [
    'Eid Specials',
    'Zaiqa Mil Bethnay Ka',
    'Fruits & Vegetables',
    'Eid Specials',
  ];

  CategoryData? getCatData;
  getCategory() async {
    try {
      getCatData = CategoryData.fromJson(CatDelModel.dummy);
    } catch (e) {
      print(e);
    }
  }

  PopularRestDelModel? getResData;
  getRestaurant() async {
    try {
      getResData = PopularRestDelModel.fromJson(PopularRestaurants.dummy);
    } catch (e) {
      print(e);
    }
  }

  int cartLength = 0;

  getCartLength() {
    cartLength = cart.length;
    rebuildUi();
    print(cartLength);
    return;
  }
}
