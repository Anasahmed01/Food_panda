import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/order_details/order_details.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';

class ProductDetailViewModel extends BaseViewModel {
  ScrollController scrollController = ScrollController();
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToCartView(
      {required String productImg,
      required String productName,
      required String productPrice,
      required String productDiscription}) {
    locator<NavigationService>().navigateWithTransition(
      OrderDetailView(
        image: productImg,
        productName: productName,
        productPrice: productPrice,
        productDiscription: productDiscription,
      ),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  List productDetailImg = [
    AppImages.product1,
    AppImages.product3,
    AppImages.product3,
    AppImages.product4,
  ];
  List productDetailNames = [
    'Xtreme Duo Box',
    'Mighty Zinger Burger',
    'Hot Wings',
    'Crispy Box',
  ];
  List productDetailDiscription = [
    'A classic burger with a crispy, seasoned chicken patty, served with fresh lettuce, tomatoes & a tangy sauce',
    'Delight in the flavors of tender chicken pieces wrapped in a soft tortilla with crisp vegetables & a medley of condiments',
    'An indulgent burger featuring two succulent chicken patties, layered with melted cheese & zesty mustard sauce for a satisfying treat',
    'A classic burger with a crispy, seasoned chicken patty, served with fresh lettuce, tomatoes & a tangy sauce',
  ];
  List productPrices = [
    '299.00',
    '599.00',
    '599.00',
    '699.00',
  ];
}
