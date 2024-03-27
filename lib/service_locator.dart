import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/data_sources/local/category_local_data_source.dart';
import 'package:flutter_assesment/features/home/data/data_sources/local/popular_local_data_source.dart';
import 'package:flutter_assesment/features/home/data/data_sources/popular_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/repositories/category_repository_impl.dart';
import 'package:flutter_assesment/features/home/data/repositories/popular_repository_impl.dart';
import 'package:flutter_assesment/features/home/domain/repositories/category_repository.dart';
import 'package:flutter_assesment/features/home/domain/repositories/popular_repository.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_popular.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutter_assesment/features/tour/data/data-sources/local/tour_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setUpLocator() async {
  /// database
  HiveService.init();
  locator.registerLazySingleton(() => HiveService());

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

  locator.registerLazySingleton<CategoryLocalDataSourceImpl>(
      () => CategoryLocalDataSourceImpl(hiveService: locator()));

  locator.registerLazySingleton<PopularLocalDataSourceImpl>(
      () => PopularLocalDataSourceImpl(hiveService: locator()));

  locator.registerLazySingleton<TourLocalDataSource>(
      () => TourLocalDataSourceImpl(hiveService: locator()));

  /// external dependencies
  ///
  locator.registerLazySingleton(() => http.Client());
}
