import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/cart/cart.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class OrderDetailViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToCartView({
    required String productImage,
    required String productName,
    required String productPrice,
    required String productQuantity,
    required String requiredItem,
  }) {
    locator<NavigationService>().navigateWithTransition(
      CartView(
        productImage: productImage,
        productName: productName,
        productPrice: productPrice,
        productQuantity: productQuantity,
        // requiredItem: requiredItem,
      ),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
  ];

  bool required = false;

  List softDrinks = [
    'Next Cola - 345 ml',
    'Mirinda - 345 ml',
    'dew - 345 ml',
    '7up - 345 ml',
  ];

  String requideSaveData = '';

  List<bool> isChecked = [
    false,
    false,
    false,
    false,
  ];

  List optionalItem = [
    'Dinner Roll',
    'Coleslaw',
    'Chicken piece',
    'Cheese',
  ];

  List optionalItemPrice = [
    '300.00',
    '100.00',
    '180.00',
    '70.00',
  ];

  List bottomSheetItem = [
    'Remove it from my order',
    'Cancel the entire order',
    'Call me & Confirm',
  ];

  List bottomSheetIsSelected = [
    false,
    false,
    false,
  ];

  var quantity = 1;

  void increment() {
    if (quantity >= 1) {
      quantity++;
    }
  }

  void decrement() {
    quantity--;
  }
}
