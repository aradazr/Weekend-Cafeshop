import 'package:weekend_cafeshop/data/model/product.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseState extends ProductState {
  final List<Product> products;

  ProductResponseState(this.products);
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState(this.message);
}
