import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';

class ProductDetailViewModel extends BaseViewModel {
  ScrollController scrollController = ScrollController();
  navigateToBack() {
    locator<NavigationService>().back();
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
  List productPrices = [
    '299.00',
    '599.00',
    '599.00',
    '699.00',
  ];
}
