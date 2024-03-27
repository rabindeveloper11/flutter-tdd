import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/data_sources/local/popular_local_data_source.dart';
import 'package:flutter_assesment/features/home/data/data_sources/popular_remote_data_source.dart';
import 'package:flutter_assesment/features/home/domain/repositories/category_repository.dart';
import 'package:flutter_assesment/features/home/domain/repositories/popular_repository.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_popular.dart';
import 'package:flutter_assesment/features/tour/data/data-sources/local/tour_local_data_source.dart';
import 'package:flutter_assesment/features/tour/data/data-sources/tour_detail_data_source.dart';
import 'package:flutter_assesment/features/tour/domain/repositories/tour_repository.dart';
import 'package:flutter_assesment/features/tour/domain/usecases/get_tour_detail.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    CategoryRepository,
    CategoryRemoteDataSource,
    GetAllCategoriesUserCase,
    PopularRepository,
    PopularRemoteDataSource,
    GetAllPopularUsecase,
    TourRepository,
    TourRemoteDetailDataSource,
    GetTourDetailUseCase,
    HiveService,
    PopularLocalDataSource,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
