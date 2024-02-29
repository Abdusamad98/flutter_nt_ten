import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/category/category_model_constants.dart';

class CategoryModel {
  final int? id;
  final String name;
  final String iconPath;
  final Color color;

  CategoryModel({
    this.id,
    required this.iconPath,
    required this.name,
    required this.color,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? iconPath,
    Color? color,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      iconPath: json[CategoryModelConstants.iconPath] as String? ?? "",
      name: json[CategoryModelConstants.name] as String? ?? "",
      color:
          Color(int.parse(json[CategoryModelConstants.color] as String? ?? "")),
      id: json[CategoryModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryModelConstants.name: name,
      CategoryModelConstants.iconPath: iconPath,
      CategoryModelConstants.color: color.value.toString(),
    };
  }

  bool canAddTaskToDatabase() {
    if (name.isEmpty) return false;
    if (iconPath.isEmpty) return false;
    return true;
  }

  static CategoryModel initialValue = CategoryModel(
    iconPath: "",
    name: "",
    color: Colors.green,
  );
}
