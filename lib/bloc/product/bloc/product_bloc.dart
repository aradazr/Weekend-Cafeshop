import 'package:bloc/bloc.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_event.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_state.dart';
import 'package:weekend_cafeshop/data/repository/product_repository.dart';
import 'package:weekend_cafeshop/di/2di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductRepository _repository = locator.get();

  ProductBloc() : super(ProductLoadingState()) {
    on<ProductRequestList>((event, emit) async {
      emit(ProductLoadingState());
      try {
        var response = await _repository.getProductsByCategory(event.categoryId);
        emit(ProductResponseState(response));
      } catch (e) {
        emit(ProductErrorState('خطا در دریافت محصولات'));
      }
    });
  }
}
