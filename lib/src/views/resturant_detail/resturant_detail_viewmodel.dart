import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/models/order_detail.dart';
import 'package:foodpanda/src/views/order_details/order_details.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class ResturantDetailViewModel extends BaseViewModel {
  OrderDetailModel? model;

  init() {
    getRestaurant();
  }

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

  navigateToOrderDetailView({
    required String productImg,
    required String productName,
    required String resturantName,
    required double productPrice,
    required String productDiscription,
    required String deliveryTime,
    required productId,
    int index = 0,
  }) {
    if (model != null) {
      locator<NavigationService>().navigateWithTransition(
        OrderDetailView(
          
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

  // List productDetailImg = [
  //   AppImages.product1,
  //   AppImages.product3,
  //   AppImages.product3,
  //   AppImages.product4,
  // ];
  // List productDetailNames = [
  //   'Xtreme Duo Box',
  //   'Mighty Zinger Burger',
  //   'Hot Wings',
  //   'Crispy Box',
  // ];
  // List productDetailDiscription = [
  //   'A classic burger with a crispy, seasoned chicken patty, served with fresh lettuce, tomatoes & a tangy sauce',
  //   'Delight in the flavors of tender chicken pieces wrapped in a soft tortilla with crisp vegetables & a medley of condiments',
  //   'An indulgent burger featuring two succulent chicken patties, layered with melted cheese & zesty mustard sauce for a satisfying treat',
  //   'A classic burger with a crispy, seasoned chicken patty, served with fresh lettuce, tomatoes & a tangy sauce',
  // ];
  // List productPrices = [
  //   '299.00',
  //   '599.00',
  //   '599.00',
  //   '699.00',
  // ];
}
