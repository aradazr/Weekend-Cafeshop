import 'package:dio/dio.dart';
import 'package:weekend_cafeshop/data/model/product.dart';
import 'package:weekend_cafeshop/di/2di.dart';
import 'package:weekend_cafeshop/utils/3api_exeption.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProductsByCategory(String categoryId);
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      // درخواست برای دریافت محصولات بر اساس categoryId
      var response = await _dio.get('collections/Product/records', queryParameters: {
        'filter': 'category = "$categoryId"'  // فیلتر محصولات بر اساس دسته
      });

      // تبدیل داده‌ها به لیست محصول
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
