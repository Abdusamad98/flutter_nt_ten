class ProductModel {
  final int id;
  final String name;
  final String description;
  final String qrCode;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.qrCode,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? qrCode,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        qrCode: qrCode ?? this.qrCode,
      );
}
