import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/models/order_detail.dart';
import 'package:foodpanda/src/views/resturant_detail/resturant_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class OrderDetailViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToResDetailView({
    required String deliveryPrice,
    required String deliveryTime,
    required String deliveryType,
    required String discountText,
    required String resturantImage,
    required String resturantName,
    required String resturantRating,
  }) {
    locator<NavigationService>().navigateWithTransition(
      ResturantDetailView(
        deliveryPrice: deliveryPrice,
        deliveryTime: deliveryTime,
        deliveryType: deliveryType,
        discountText: discountText,
        resturantImage: resturantImage,
        resturantName: resturantName,
        resturantRating: resturantRating,
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

  String? selectedValue;

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

  addToCart({required cartData}) {
    cart.firstWhere(
      (item) => item == cartData[5],
      orElse: () {
        cart.add(cartData);
      },
    );

    // for (var i = 0; i < cart.length; i++) {
    //   if (cart.contains(cart[i]["product_id"]) == true) {
    //     print('product already exiest in cart');
    //   } else {
    //     cart.add(cartData);
    //     print(cart);
    //   }
    // }
  }

  var quantity = 1;

  void addQuantity() {
    // final index = cart.indexWhere((element) => element.id == id);
    // cart[index].value = cart[index].quantity!.value + 1;
    quantity++;
    //notifyListeners();
  }

  void decrement() {
    quantity--;
  }

  OrderDetailModel? getData;
  getRes() async {
    try {
      getData = OrderDetailModel.fromJson(OrderDelModel.dummy);
    } catch (e) {
      print(e);
    }
  }

  // void checkAlreadyExItem(Datum newItem) {
  //   var existingItem = cart.firstWhere(
  //     (item) => item["product_id"] == newItem["product_id"] ,
  //     orElse: () => null,
  //   );
  //   newItem.add(newItem);
  // }
}
