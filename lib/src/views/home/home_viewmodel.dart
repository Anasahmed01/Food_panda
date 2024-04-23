// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/cat_del_model.dart';
import 'package:foodpanda/src/models/category_data.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:foodpanda/src/views/category/category.dart';
import 'package:foodpanda/src/views/porduct_detail/product_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
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

  navigateToProductDetailView(
      {required String deliveryType,
      required String deliveryPrice,
      required String productName,
      required String deliveryTime,
      required String discountText,
      required String productImage}) {
    locator<NavigationService>().navigateWithTransition(
      ProductDetailView(
        productImage: productImage,
        discountText: discountText,
        deliveryType: deliveryType,
        deliveryPrice: deliveryPrice,
        productName: productName,
        deliveryTime: deliveryTime,
      ),
      opaque: true,
      duration: const Duration(milliseconds: 100),
      transitionStyle: Transition.leftToRight,
      curve: Curves.ease,
    );
  }

  List categoryData = [
    'Food delivery',
    'Shops',
    'Pick-up',
    'Dine-in',
    'Catering',
    'Pandago',
  ];
  List categorySubData = [
    'Order food you love',
    'Top brands to your door',
    'Self-collect for 50% off',
    'Go out to eat for 25% off',
    'Plan events with ease',
    'Send parcels in a tap'
  ];
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

  //popular Restaurants data

  List popularResImg = [
    AppImages.popularRes3,
    AppImages.popularRes2,
    AppImages.popularRes1,
  ];

  List popularResText = [
    'Featured',
    'Free delivery',
    'Welcome gift: Rs:100 off',
  ];

  List popularResDiscountText = [
    '10%  off',
    '30%  off',
    '40%  off',
  ];

  List popularResItemNames = [
    'Subway - PECHS',
    'Allah Wala Pakwan And Sheermall House',
    "Domino's Pizza - SMCHS",
  ];

  List popularResItemPrices = [
    '249 minimum',
    '259 minimum',
    '500 minimum',
  ];

  List popularResDeliveryTimes = [
    '25-40 min',
    '22-35 min',
    '30-45 min',
  ];

  List popularResItemType = [
    'Fast Food',
    'Desi Food',
    'Fast Food',
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

  CategoryData? getData;
  getRes() async {
    try {
      getData = CategoryData.fromJson(CatDelModel.dummy);
    } catch (e) {
      print(e);
    }
  }

  // List categoryData = [
  //   {'title': 'Food delivery', 'subtitle': 'Order food you love'},
  //   {'title': 'Shops', 'subtitle': 'Top brands to your door'},
  //   {'title': 'Pick-up', 'subtitle': 'Self-collect for 50% off'},
  //   {'title': 'Dine-in', 'subtitle': 'Go out to eat for 25% off'},
  //   {'title': 'Catering', 'subtitle': 'Plan events with ease'},
  //   {'title': 'Pandago', 'subtitle': 'Send parcels in a tap'},
  // ];

  //List categorySubTitleData = ['','','','','',''];
}
