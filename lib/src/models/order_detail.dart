// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) =>
    json.encode(data.toJson());

class OrderDetailModel {
  List<Datum> data;

  OrderDetailModel({
    required this.data,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String productName;
  String productImage;
  double productPrice;
  int productId;
  String discription;
  List<RequideItem> requideItems;
  List<OptionalItem> optionalItem;

  Datum({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.discription,
    required this.requideItems,
    required this.optionalItem,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productName: json["product_name"],
        productImage: json["product_image"],
        productPrice: json["product_price"],
        productId: json["product_id"],
        discription: json["discription"],
        requideItems: List<RequideItem>.from(
            json["requide_items"].map((x) => RequideItem.fromJson(x))),
        optionalItem: List<OptionalItem>.from(
            json["optional_item"].map((x) => OptionalItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_image": productImage,
        "product_price": productPrice,
        "product_id": productId,
        "discription": discription,
        "requide_items":
            List<dynamic>.from(requideItems.map((x) => x.toJson())),
        "optional_item":
            List<dynamic>.from(optionalItem.map((x) => x.toJson())),
      };
}

class OptionalItem {
  String optionalItemName;
  dynamic optionalItemPrice;

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
