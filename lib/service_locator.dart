import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/data_sources/popular_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/repositories/category_repository_impl.dart';
import 'package:flutter_assesment/features/home/data/repositories/popular_repository_impl.dart';
import 'package:flutter_assesment/features/home/domain/repositories/category_repository.dart';
import 'package:flutter_assesment/features/home/domain/repositories/popular_repository.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_popular.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setUpLocator() {
  /// blocs
  locator.registerFactory(() => CategoryBloc(locator()));

  locator.registerFactory(() => PopularBloc(
        getAllPopularUseCase: locator(),
      ));

  /// usecases
  locator.registerLazySingleton(() => GetAllCategoriesUserCase(locator()));
  locator.registerLazySingleton(() => GetAllPopularUsecase(locator()));

  /// repositories
  locator.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<PopularRepository>(
      () => PopularRepositoryImpl(remoteDataSource: locator()));

  /// data sources

  locator.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategorySourceDataImpl(client: locator()));

  locator.registerLazySingleton<PopularRemoteDataSource>(
      () => PopularRemoteDataSourceImpl(client: locator()));

  /// external dependencies
  ///
  locator.registerLazySingleton(() => http.Client());
}