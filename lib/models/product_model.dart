class ProductModel {
  final String productName;
  final String productDescription;
  final String image;
  final ProductCategory category;

  ProductModel({
    required this.category,
    required this.productName,
    required this.image,
    required this.productDescription,
  });
}

enum ProductCategory {
  all,
  dresses,
  jeans,
  shoes,
  jackets,
}
