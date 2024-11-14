import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weekend_cafeshop/data/datasource/category_datasource.dart';
import 'package:weekend_cafeshop/data/repository/category_repository.dart';


var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://pocketbase-5i4fn3.chbk.app/api/'),
    ),
  );
  
//https://pocketbase-5i4fn3.chbk.app/api/
  locator.registerFactory<ICategoryDatasource>(
    () => CategoryRemoteDatasource(),
  );
  

  //!---------------------------------------------------------------------

  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );
  
}