// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:foodpanda/src/models/order_detail.dart' as _i10;
import 'package:foodpanda/src/views/basic/splash/splash.dart' as _i2;
import 'package:foodpanda/src/views/cart/cart.dart' as _i7;
import 'package:foodpanda/src/views/category/category.dart' as _i4;
import 'package:foodpanda/src/views/home/home.dart' as _i3;
import 'package:foodpanda/src/views/order_details/order_details.dart' as _i6;
import 'package:foodpanda/src/views/resturant_detail/resturant_detail.dart'
    as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const splashView = '/';

  static const homeView = '/home-view';

  static const categoryView = '/category-view';

  static const resturantDetailView = '/resturant-detail-view';

  static const orderDetailView = '/order-detail-view';

  static const cartView = '/cart-view';

  static const all = <String>{
    splashView,
    homeView,
    categoryView,
    resturantDetailView,
    orderDetailView,
    cartView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.categoryView,
      page: _i4.CategoryView,
    ),
    _i1.RouteDef(
      Routes.resturantDetailView,
      page: _i5.ResturantDetailView,
    ),
    _i1.RouteDef(
      Routes.orderDetailView,
      page: _i6.OrderDetailView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i7.CartView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomeView(),
        settings: data,
      );
    },
    _i4.CategoryView: (data) {
      final args = data.getArgs<CategoryViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.CategoryView(key: args.key, categoryName: args.categoryName),
        settings: data,
      );
    },
    _i5.ResturantDetailView: (data) {
      final args = data.getArgs<ResturantDetailViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.ResturantDetailView(
            key: args.key,
            deliveryTime: args.deliveryTime,
            resturantName: args.resturantName,
            deliveryType: args.deliveryType,
            deliveryPrice: args.deliveryPrice,
            discountText: args.discountText,
            resturantImage: args.resturantImage,
            resturantRating: args.resturantRating),
        settings: data,
      );
    },
    _i6.OrderDetailView: (data) {
      final args = data.getArgs<OrderDetailViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.OrderDetailView(
            key: args.key,
            productName: args.productName,
            productPrice: args.productPrice,
            productImage: args.productImage,
            productDiscription: args.productDiscription,
            model: args.model,
            resturantName: args.resturantName,
            deliveryTime: args.deliveryTime),
        settings: data,
      );
    },
    _i7.CartView: (data) {
      final args = data.getArgs<CartViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.CartView(
            key: args.key,
            resturantName: args.resturantName,
            deliveryTime: args.deliveryTime,
            productName: args.productName,
            productPrice: args.productPrice,
            productImage: args.productImage),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CategoryViewArguments {
  const CategoryViewArguments({
    this.key,
    required this.categoryName,
  });

  final _i9.Key? key;

  final String categoryName;

  @override
  String toString() {
    return '{"key": "$key", "categoryName": "$categoryName"}';
  }

  @override
  bool operator ==(covariant CategoryViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ categoryName.hashCode;
  }
}

class ResturantDetailViewArguments {
  const ResturantDetailViewArguments({
    this.key,
    required this.deliveryTime,
    required this.resturantName,
    required this.deliveryType,
    required this.deliveryPrice,
    required this.discountText,
    required this.resturantImage,
    required this.resturantRating,
  });

  final _i9.Key? key;

  final String deliveryTime;

  final String resturantName;

  final String deliveryType;

  final String deliveryPrice;

  final String discountText;

  final String resturantImage;

  final String resturantRating;

  @override
  String toString() {
    return '{"key": "$key", "deliveryTime": "$deliveryTime", "resturantName": "$resturantName", "deliveryType": "$deliveryType", "deliveryPrice": "$deliveryPrice", "discountText": "$discountText", "resturantImage": "$resturantImage", "resturantRating": "$resturantRating"}';
  }

  @override
  bool operator ==(covariant ResturantDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.deliveryTime == deliveryTime &&
        other.resturantName == resturantName &&
        other.deliveryType == deliveryType &&
        other.deliveryPrice == deliveryPrice &&
        other.discountText == discountText &&
        other.resturantImage == resturantImage &&
        other.resturantRating == resturantRating;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        deliveryTime.hashCode ^
        resturantName.hashCode ^
        deliveryType.hashCode ^
        deliveryPrice.hashCode ^
        discountText.hashCode ^
        resturantImage.hashCode ^
        resturantRating.hashCode;
  }
}

class OrderDetailViewArguments {
  const OrderDetailViewArguments({
    this.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDiscription,
    required this.model,
    required this.resturantName,
    required this.deliveryTime,
  });

  final _i9.Key? key;

  final String productName;

  final String productPrice;

  final String productImage;

  final String productDiscription;

  final _i10.Datum model;

  final String resturantName;

  final String deliveryTime;

  @override
  String toString() {
    return '{"key": "$key", "productName": "$productName", "productPrice": "$productPrice", "productImage": "$productImage", "productDiscription": "$productDiscription", "model": "$model", "resturantName": "$resturantName", "deliveryTime": "$deliveryTime"}';
  }

  @override
  bool operator ==(covariant OrderDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.productImage == productImage &&
        other.productDiscription == productDiscription &&
        other.model == model &&
        other.resturantName == resturantName &&
        other.deliveryTime == deliveryTime;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        productName.hashCode ^
        productPrice.hashCode ^
        productImage.hashCode ^
        productDiscription.hashCode ^
        model.hashCode ^
        resturantName.hashCode ^
        deliveryTime.hashCode;
  }
}

class CartViewArguments {
  const CartViewArguments({
    this.key,
    required this.resturantName,
    required this.deliveryTime,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  final _i9.Key? key;

  final String resturantName;

  final String deliveryTime;

  final String productName;

  final String productPrice;

  final String productImage;

  @override
  String toString() {
    return '{"key": "$key", "resturantName": "$resturantName", "deliveryTime": "$deliveryTime", "productName": "$productName", "productPrice": "$productPrice", "productImage": "$productImage"}';
  }

  @override
  bool operator ==(covariant CartViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.resturantName == resturantName &&
        other.deliveryTime == deliveryTime &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.productImage == productImage;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        resturantName.hashCode ^
        deliveryTime.hashCode ^
        productName.hashCode ^
        productPrice.hashCode ^
        productImage.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryView({
    _i9.Key? key,
    required String categoryName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.categoryView,
        arguments: CategoryViewArguments(key: key, categoryName: categoryName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResturantDetailView({
    _i9.Key? key,
    required String deliveryTime,
    required String resturantName,
    required String deliveryType,
    required String deliveryPrice,
    required String discountText,
    required String resturantImage,
    required String resturantRating,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resturantDetailView,
        arguments: ResturantDetailViewArguments(
            key: key,
            deliveryTime: deliveryTime,
            resturantName: resturantName,
            deliveryType: deliveryType,
            deliveryPrice: deliveryPrice,
            discountText: discountText,
            resturantImage: resturantImage,
            resturantRating: resturantRating),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderDetailView({
    _i9.Key? key,
    required String productName,
    required String productPrice,
    required String productImage,
    required String productDiscription,
    required _i10.Datum model,
    required String resturantName,
    required String deliveryTime,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.orderDetailView,
        arguments: OrderDetailViewArguments(
            key: key,
            productName: productName,
            productPrice: productPrice,
            productImage: productImage,
            productDiscription: productDiscription,
            model: model,
            resturantName: resturantName,
            deliveryTime: deliveryTime),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView({
    _i9.Key? key,
    required String resturantName,
    required String deliveryTime,
    required String productName,
    required String productPrice,
    required String productImage,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.cartView,
        arguments: CartViewArguments(
            key: key,
            resturantName: resturantName,
            deliveryTime: deliveryTime,
            productName: productName,
            productPrice: productPrice,
            productImage: productImage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryView({
    _i9.Key? key,
    required String categoryName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.categoryView,
        arguments: CategoryViewArguments(key: key, categoryName: categoryName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResturantDetailView({
    _i9.Key? key,
    required String deliveryTime,
    required String resturantName,
    required String deliveryType,
    required String deliveryPrice,
    required String discountText,
    required String resturantImage,
    required String resturantRating,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resturantDetailView,
        arguments: ResturantDetailViewArguments(
            key: key,
            deliveryTime: deliveryTime,
            resturantName: resturantName,
            deliveryType: deliveryType,
            deliveryPrice: deliveryPrice,
            discountText: discountText,
            resturantImage: resturantImage,
            resturantRating: resturantRating),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderDetailView({
    _i9.Key? key,
    required String productName,
    required String productPrice,
    required String productImage,
    required String productDiscription,
    required _i10.Datum model,
    required String resturantName,
    required String deliveryTime,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.orderDetailView,
        arguments: OrderDetailViewArguments(
            key: key,
            productName: productName,
            productPrice: productPrice,
            productImage: productImage,
            productDiscription: productDiscription,
            model: model,
            resturantName: resturantName,
            deliveryTime: deliveryTime),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView({
    _i9.Key? key,
    required String resturantName,
    required String deliveryTime,
    required String productName,
    required String productPrice,
    required String productImage,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.cartView,
        arguments: CartViewArguments(
            key: key,
            resturantName: resturantName,
            deliveryTime: deliveryTime,
            productName: productName,
            productPrice: productPrice,
            productImage: productImage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
