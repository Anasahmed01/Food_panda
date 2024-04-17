import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/category/see_all/see_all.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';

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
}
