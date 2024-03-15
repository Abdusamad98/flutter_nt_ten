import 'package:flutter/material.dart';

class BookModel {
  BookModel({
    required this.description,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.categoryId,
    required this.uuid,
    required this.rate,
    required this.author,
  });

  final String productName;
  final String author;
  final double rate;
  final double price;
  final String description;
  final int categoryId;
  final String imageUrl;
  final String uuid;

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      productName: json["book_name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      uuid: json["_uuid"] as String? ?? "",
      categoryId: json["category_id"] as int? ?? 0,
      rate: json["rate"] as double? ?? 0.0,
      author: json["author"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "book_name": productName,
      "price": price,
      "description": description,
      "rate": rate,
      "image_url": imageUrl,
      "author": author,
      "category_id": categoryId,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "book_name": productName,
      "price": price,
      "description": description,
      "rate": rate,
      "image_url": imageUrl,
      "_uuid": uuid,
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
