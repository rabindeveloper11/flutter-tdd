import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';

abstract class PopularLocalDataSource {
  Future<List<PopularModel>> getSavedPopulars();
  Future<List<PopularModel>> search(String query);
  Future<void> savePopular(Map<String, dynamic> data);
  Future<void> deletePopular(int index);
}

/// This class handles all the operation related to Popular Data in Local Storage
class PopularLocalDataSourceImpl implements PopularLocalDataSource {
  final HiveService hiveService;

  PopularLocalDataSourceImpl({required this.hiveService});

  /// Gets all the saved Popular Data from Local Storage
  @override
  Future<List<PopularModel>> getSavedPopulars() async {
    try {
      List<PopularModel> populars = [];
      final data = await hiveService.getData(HiveService.savedPopular);
      populars = data.map((e) {
        return PopularModel.fromJson(e);
      }).toList();

      return populars;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  /// Searches the Popular Data from Local Storage

  @override
  Future<List<PopularModel>> search(String query) async {
    try {
      final data = await hiveService.getData(HiveService.savedPopular);

      final List<PopularModel> populars =
          data.map((e) => PopularModel.fromJson(e)).toList();

      final searchedPopulars = populars.where((element) {
        return element.title.contains(query);
      }).toList();

      return searchedPopulars;
    } catch (e) {
      throw ServerException();
    }
  }

  /// Saves the Popular Data to Local Storage

  @override
  Future<void> savePopular(Map<String, dynamic> data) async {
    try {
      await hiveService.addData(HiveService.savedPopular, data);
    } catch (e) {
      throw ServerException();
    }
  }

  /// Deletes the Popular Data from Local Storage

  @override
  Future<void> deletePopular(int index) async {
    try {
      await hiveService.deleteData(HiveService.savedPopular, index);
    } catch (e) {
      throw ServerException();
    }
  }
}
