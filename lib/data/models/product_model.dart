import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    required this.color,
    required this.description,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.dateTime,
    required this.productId,
  });

  final String productName;
  final double price;
  final String description;
  final Color color;
  final String imageUrl;
  final String productId;
  final DateTime dateTime;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["product_name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      color: (json["color"] as String? ?? "FFFFFF").toColor(),
      dateTime: DateTime.fromMillisecondsSinceEpoch(
          (json["_created"] as num).toInt() * 1000),
      productId: json["_uuid"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "color": "FF0000",
      "image_url": imageUrl,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "color": "FF0000",
      "image_url": imageUrl,
      "_uuid": productId,
    };
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
