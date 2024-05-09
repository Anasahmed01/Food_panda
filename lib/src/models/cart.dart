// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  String productName;
  String productImage;
  int productPrice;
  int productId;
  String deliveryTime;
  String resturantName;
  String requiredItem;
  int quantity;

  CartModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.deliveryTime,
    required this.resturantName,
    required this.requiredItem,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        productName: json["product_name"],
        productImage: json["product_image"],
        productPrice: json["product_price"],
        productId: json["product_id"],
        deliveryTime: json["delivery_time"],
        resturantName: json["resturant_name"],
        requiredItem: json["required_item"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_image": productImage,
        "product_price": productPrice,
        "product_id": productId,
        "delivery_time": deliveryTime,
        "resturant_name": resturantName,
        "required_item": requiredItem,
        "quantity": quantity,
      };
}
