import 'package:dartz/dartz.dart';
import 'package:weekend_cafeshop/data/datasource/category_datasource.dart';
import 'package:weekend_cafeshop/data/model/category.dart';
import 'package:weekend_cafeshop/di/2di.dart';
import 'package:weekend_cafeshop/utils/3api_exeption.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getGategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اینترنت قطع میباشد');
    }
  }
}