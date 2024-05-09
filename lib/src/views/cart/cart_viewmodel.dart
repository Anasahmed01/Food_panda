import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/views/cart/widget/update_quantity/update_quantity.dart';
import 'package:foodpanda/src/views/home/home.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../models/order_detail.dart';
import '../checkout/checkout.dart';

class CartViewModel extends BaseViewModel {
  init() {
    for (int j = 0; j < cart.length; j++) {
      double pp = cart[j]["product_price"];

      sumPrice(pp);
    }
    getRestaurant();
  }

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

  navigateToCheckOutView({required totalPrice}) {
    locator<NavigationService>().navigateWithTransition(
      CheckoutView(
        totalPrice: totalPrice,
      ),
    );
  }

  OrderDetailModel? model;

  getRestaurant() {
    try {
      model = OrderDetailModel.fromJson(OrderDelModel.dummy);
    } catch (e) {
      print(e);
    }
  }

  navigateToQuantityView({
    required int index,
    required String productImage,
    required String productName,
    required double productPrice,
    required String requireditem,
  }) {
    locator<NavigationService>().navigateWithTransition(
      UpdateQuantity(
        productImage: productImage,
        productName: productName,
        productPrice: productPrice,
        requireditem: requireditem,
        model: model!.data[index],
      ),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
    print(model);
  }

  bool isToggled = false;

  bool customIcon = false;

  double totalPrice = 0;
  sumPrice(double pp) {
    totalPrice += pp;
  }

  // var quantity = 1;

  // void increment() {
  //   if (quantity >= 1) {
  //     quantity++;
  //   }
  // }

  // void decrement() {
  //   quantity--;
  // }

  deleteProduct(int index) {
    cart.removeAt(index);
  }
}
