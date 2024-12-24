import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weekend_cafeshop/data/datasource/category_datasource.dart';
import 'package:weekend_cafeshop/data/datasource/product_datasource.dart';
import 'package:weekend_cafeshop/data/repository/category_repository.dart';
import 'package:weekend_cafeshop/data/repository/product_repository.dart';


var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https'),
    ),
  );
  

  locator.registerFactory<ICategoryDatasource>(
    () => CategoryRemoteDatasource(),
  );
  
  locator.registerFactory<IProductDatasource>(
    () => ProductRemoteDatasource(),
  );
  

  //!---------------------------------------------------------------------

  locator.registerFactory<IProductRepository>(
    () => ProductRepository(productDatasource: locator<IProductDatasource>()),
  );
  
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );
  
}
