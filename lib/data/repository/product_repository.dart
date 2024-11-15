
import 'package:weekend_cafeshop/data/datasource/product_datasource.dart';
import 'package:weekend_cafeshop/data/model/product.dart';
import 'package:weekend_cafeshop/utils/3api_exeption.dart';

abstract class IProductRepository {
  Future<List<Product>> getProductsByCategory(String categoryId);
}

class ProductRepository implements IProductRepository {
  final IProductDatasource productDatasource;

  // ساخت کلاس ریپازیتوری با دریافت دیتاسورس از بیرون (برای تزریق وابستگی)
  ProductRepository({required this.productDatasource});

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      // فراخوانی متد دیتاسورس برای دریافت محصولات بر اساس categoryId
      return await productDatasource.getProductsByCategory(categoryId);
    } catch (e) {
      throw ApiException(0, 'Failed to load products');
    }
  }
}
