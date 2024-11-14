import 'package:dio/dio.dart';
import 'package:weekend_cafeshop/data/model/category.dart';
import 'package:weekend_cafeshop/di/2di.dart';
import 'package:weekend_cafeshop/utils/3api_exeption.dart';


abstract class ICategoryDatasource {
  Future<List<Category>> getGategories();
}

class CategoryRemoteDatasource extends ICategoryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Category>> getGategories() async {
    try {
      var respones = await _dio.get('collections/Category/records');
      return respones.data['items']
          .map<Category>((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
