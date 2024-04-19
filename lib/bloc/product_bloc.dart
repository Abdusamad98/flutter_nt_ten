import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/models/form_status.dart';
import 'package:flutter_nt_ten/data/models/product_model.dart';
import 'package:flutter_nt_ten/data/repsitories/product_repository.dart';
import 'package:flutter_nt_ten/services/service_locator.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(
          const ProductState(
            status: FormStatus.pure,
            products: [],
            statusText: '',
          ),
        ) {
    on<LoadProducts>(_load);
    on<AddProductEvent>(_addProduct);
    on<RemoveProductEvent>(_deleteProduct);
  }

  Future<void> _load(LoadProducts event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(
      state.copyWith(
        status: FormStatus.success,
        products: getIt.get<ProductRepository>().products,
      ),
    );
  }

  Future<void> _addProduct(AddProductEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        status: FormStatus.success,
        products: [
          ...state.products,
          event.productModel,
        ],
      ),
    );
  }

  Future<void> _deleteProduct(RemoveProductEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    await Future.delayed(const Duration(seconds: 2));

    List<ProductModel> products = state.products;
    products.removeWhere((element) => element.id == event.productId);
    emit(
      state.copyWith(
        status: FormStatus.success,
        products: products,
      ),
    );
  }
}
