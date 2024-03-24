import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/domain/repositories/category_repository.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    CategoryRepository,
    CategoryRemoteDataSource,
    GetAllCategoriesUserCase,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
