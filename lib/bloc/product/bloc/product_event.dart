abstract class ProductEvent {}

class ProductRequestList extends ProductEvent {
  final String categoryId;

  ProductRequestList({required this.categoryId});
}
