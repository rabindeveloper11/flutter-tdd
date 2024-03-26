import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/models/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getSavedCategories();
  Future<List<CategoryModel>> search(String query);
  Future<void> saveCategory(Map<String, dynamic> data);
  Future<void> deleteCategory(int index);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final HiveService hiveService;

  CategoryLocalDataSourceImpl({required this.hiveService});

  @override
  Future<List<CategoryModel>> getSavedCategories() async {
    try {
      List<CategoryModel> categories = [];
      final data = await hiveService.getData(HiveService.savedCategories);
      categories = data.map((e) {
        return CategoryModel.fromJson(e);
      }).toList();

      return categories;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<List<CategoryModel>> search(String query) async {
    try {
      final data = await hiveService.getData(HiveService.savedCategories);

      final List<CategoryModel> categories =
          data.map((e) => CategoryModel.fromJson(e)).toList();

      final searchedCategories = categories.where((element) {
        return element.name.contains(query);
      }).toList();

      return searchedCategories;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> saveCategory(Map<String, dynamic> data) async {
    try {
      await hiveService.addData(HiveService.savedCategories, data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteCategory(int index) async {
    try {
      await hiveService.deleteData(HiveService.savedCategories, index);
    } catch (e) {
      throw ServerException();
    }
  }
}
