class CoffeeModel {
  final int? dbId;
  final int? count;
  final String name;
  final String description;
  final String subtitle;
  final double rate;
  final double price;
  final String type;
  final int categoryId;
  final String imagePath;
  final bool isFavourite;

  CoffeeModel({
    required this.name,
    required this.price,
    required this.description,
    required this.subtitle,
    required this.type,
    this.count,
    this.dbId,
    required this.rate,
    required this.categoryId,
    required this.imagePath,
    required this.isFavourite,
  });

  CoffeeModel copyWith({
    int? dbId,
    int? count,
    String? name,
    String? description,
    String? subtitle,
    double? rate,
    double? price,
    String? type,
    int? categoryId,
    String? imagePath,
    bool? isFavourite,
  }) {
    return CoffeeModel(
      description: description ?? this.description,
      dbId: dbId ?? this.dbId,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      isFavourite: isFavourite ?? this.isFavourite,
      rate: rate ?? this.rate,
      type: type ?? this.type,
      count: count ?? this.count,
    );
  }

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      name: json["name"] as String? ?? "",
      price: json["price"] as double? ?? 0.0,
      description: json["description"] as String? ?? "",
      subtitle: json["subtitle"] as String? ?? "",
      type: json["type"] as String? ?? "",
      rate: json["rate"] as double? ?? 0.0,
      categoryId: json["category_id"] as int? ?? 0,
      dbId: json["_id"] as int? ?? 0,
      imagePath: json["image_path"] as String? ?? "",
      count: json["count"] as int? ?? 0,
      isFavourite: (json["is_favourite"] as int? ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "name": name,
      "category_id": categoryId,
      "subtitle": subtitle,
      "price": price,
      "image_path": imagePath,
      "rate": rate,
      "type": type,
      "count": count ?? 0,
      "is_favourite": isFavourite ? 1 : 0,
    };
  }

// CoffeeModel
}
