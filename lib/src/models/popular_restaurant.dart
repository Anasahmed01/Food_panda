// To parse this JSON data, do
//
//     final popularRestDelModel = popularRestDelModelFromJson(jsonString);

import 'dart:convert';

PopularRestDelModel popularRestDelModelFromJson(String str) =>
    PopularRestDelModel.fromJson(json.decode(str));

String popularRestDelModelToJson(PopularRestDelModel data) =>
    json.encode(data.toJson());

class PopularRestDelModel {
  List<Datum> data;

  PopularRestDelModel({
    required this.data,
  });

  factory PopularRestDelModel.fromJson(Map<String, dynamic> json) =>
      PopularRestDelModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String restaurantsImage;
  String restaurantsName;
  String minimumPrice;
  String restaurantsRating;
  String restaurantsType;
  String deliveryTime;
  String discount;
  String offer;

  Datum({
    required this.restaurantsImage,
    required this.restaurantsName,
    required this.minimumPrice,
    required this.restaurantsRating,
    required this.restaurantsType,
    required this.deliveryTime,
    required this.discount,
    required this.offer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        restaurantsImage: json["restaurants_image"],
        restaurantsName: json["restaurants_name"],
        minimumPrice: json["minimum_price"],
        restaurantsRating: json["restaurants_rating"],
        restaurantsType: json["restaurants_type"],
        deliveryTime: json["delivery_time"],
        discount: json["discount"],
        offer: json["offer"],
      );

  Map<String, dynamic> toJson() => {
        "restaurants_image": restaurantsImage,
        "restaurants_name": restaurantsName,
        "minimum_price": minimumPrice,
        "restaurants_rating": restaurantsRating,
        "restaurants_type": restaurantsType,
        "delivery_time": deliveryTime,
        "discount": discount,
        "offer": offer,
      };
}
