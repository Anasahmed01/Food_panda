import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/popular_restaurants.dart';
import 'package:foodpanda/src/models/popular_restaurant.dart';
import 'package:foodpanda/src/views/category/see_all/see_all.dart';
import 'package:foodpanda/src/views/favourite/favourite.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';
import '../cart/cart.dart';
import '../resturant_detail/resturant_detail.dart';

class CategoryViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToSeeAllView() {
    locator<NavigationService>().navigateWithTransition(
      const SeeAllView(),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  navigateToResturantDetailView({
    required String deliveryType,
    required String deliveryPrice,
    required String resturantName,
    required String deliveryTime,
    required String discountText,
    required String resturantImage,
    required String resturantRating,
  }) {
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
    );
  }

  navigateToCartView() {
    locator<NavigationService>().navigateWithTransition(
      const CartView(),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  navigateToFavouriteView() {
    locator<NavigationService>().navigateWithTransition(
      const FavouriteView(),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  List dealImages = [
    AppImages.deal4,
    AppImages.deal5,
    AppImages.deal1,
    AppImages.deal2,
    AppImages.deal3,
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
  //popular Restaurants data

  List popularResImg = [
    AppImages.popularRes3,
    AppImages.popularRes2,
    AppImages.popularRes1,
  ];

  List popularResText = [
    'Gift: Free delivery',
    'Gift: Free delivery',
    'Gift: Free delivery',
  ];

  List popularResDiscountText = [
    '10% off',
    '30% off',
    '40% off',
  ];

  List popularResItemNames = [
    'Subway - PECHS',
    'Allah Wala Pakwan And Sheermall House',
    "Domino's Pizza - SMCHS",
  ];

  List popularResItemType = [
    'Fast Food',
    'Desi Food',
    'Fast Food',
  ];

  List popularResDeliveryTimes = [
    '25-40',
    '22-35',
    '30-45',
  ];

  List storeRating = [
    '4.2',
    '4.7',
    '4.3',
  ];

  PopularRestDelModel? getResData;
  getRes() async {
    try {
      getResData = PopularRestDelModel.fromJson(PopularRestaurants.dummy);
    } catch (e) {
      print(e);
    }
  }
}
