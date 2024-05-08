import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/models/order_detail.dart';
import 'package:foodpanda/src/views/cart/cart.dart';
import 'package:foodpanda/src/views/favourite/favourite.dart';
import 'package:foodpanda/src/views/home/home.dart';
import 'package:foodpanda/src/views/order_details/order_details.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class ResturantDetailViewModel extends BaseViewModel {
  OrderDetailModel? model;

  getRestaurant() {
    try {
      model = OrderDetailModel.fromJson(OrderDelModel.dummy);
    } catch (e) {
      print(e);
    }
  }

  ScrollController scrollController = ScrollController();
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToHomeView() {
    locator<NavigationService>().navigateWithTransition(
      const HomeView(),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  navigateToCartView() {
    locator<NavigationService>().navigateWithTransition(
      const CartView(),
    );
  }

  navigateToFavouriteView() {
    locator<NavigationService>().navigateWithTransition(
      const FavouriteView(),
    );
  }

  navigateToOrderDetailView({
    required String productImg,
    required String productName,
    required String resturantName,
    required double productPrice,
    required String productDiscription,
    required String deliveryTime,
    required String deliveryPrice,
    required String deliveryType,
    required String discountText,
    required String resturantImage,
    required String resturantRating,
    required productId,
    int index = 0,
  }) {
    if (model != null) {
      locator<NavigationService>().navigateWithTransition(
        OrderDetailView(
          deliveryPrice: deliveryPrice,
          deliveryType: deliveryType,
          discountText: discountText,
          resturantImage: resturantImage,
          resturantRating: resturantRating,
          productId: productId,
          deliveryTime: deliveryTime,
          resturantName: resturantName,
          productImage: productImg,
          productName: productName,
          productPrice: productPrice,
          productDiscription: productDiscription,
          model: model!.data[index],
        ),
        opaque: true,
        duration: const Duration(milliseconds: 500),
        transitionStyle: Transition.downToUp,
        curve: Curves.slowMiddle,
      );
    }
  }
}
