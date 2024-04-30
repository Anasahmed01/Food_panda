import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/home/home.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
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

  bool customIcon = false;

  double totalPrice = 0;
  sumPrice(double p) {
    totalPrice += p;
  }
}
