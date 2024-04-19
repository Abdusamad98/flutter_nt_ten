part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {}

class AddProductEvent extends ProductEvent {
  final ProductModel productModel;

  AddProductEvent({required this.productModel});

  @override
  List<Object?> get props => [productModel];
}

class RemoveProductEvent extends ProductEvent {
  final int productId;

  RemoveProductEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class UpdateProductEvent extends ProductEvent {
  final ProductModel updatedProduct;

  UpdateProductEvent({required this.updatedProduct});

  @override
  List<Object?> get props => [updatedProduct];
}

class DeleteAllProductsEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {
  @override
  List<Object?> get props => [];
}
