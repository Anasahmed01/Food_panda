// To parse this JSON data, do
//
//     final orderDetModel = orderDetModelFromJson(jsonString);

import 'dart:convert';

OrderDetModel orderDetModelFromJson(String str) =>
    OrderDetModel.fromJson(json.decode(str));

String orderDetModelToJson(OrderDetModel data) => json.encode(data.toJson());

class OrderDetModel {
  List<Datum> data;

  OrderDetModel({
    required this.data,
  });

  factory OrderDetModel.fromJson(Map<String, dynamic> json) => OrderDetModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String storeName;
  String productName;
  String productImage;
  String productPrice;
  String discription;
  List<RequideItem> requideItems;
  List<OptionalItem> optionalItem;

  Datum({
    required this.storeName,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.discription,
    required this.requideItems,
    required this.optionalItem,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        storeName: json["store_name"],
        productName: json["product_name"],
        productImage: json["product_image"],
        productPrice: json["product_price"],
        discription: json["discription"],
        requideItems: List<RequideItem>.from(
            json["requide_items"].map((x) => RequideItem.fromJson(x))),
        optionalItem: List<OptionalItem>.from(
            json["optional_item"].map((x) => OptionalItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "store_name": storeName,
        "product_name": productName,
        "product_image": productImage,
        "product_price": productPrice,
        "discription": discription,
        "requide_items":
            List<dynamic>.from(requideItems.map((x) => x.toJson())),
        "optional_item":
            List<dynamic>.from(optionalItem.map((x) => x.toJson())),
      };
}

class OptionalItem {
  String optionalItemName;
  String optionalItemPrice;

  OptionalItem({
    required this.optionalItemName,
    required this.optionalItemPrice,
  });

  factory OptionalItem.fromJson(Map<String, dynamic> json) => OptionalItem(
        optionalItemName: json["optional_item_name"],
        optionalItemPrice: json["optional_item_price"],
      );

  Map<String, dynamic> toJson() => {
        "optional_item_name": optionalItemName,
        "optional_item_price": optionalItemPrice,
      };
}

class RequideItem {
  String coldDrink;

  RequideItem({
    required this.coldDrink,
  });

  factory RequideItem.fromJson(Map<String, dynamic> json) => RequideItem(
        coldDrink: json["cold_drink"],
      );

  Map<String, dynamic> toJson() => {
        "cold_drink": coldDrink,
      };
}
