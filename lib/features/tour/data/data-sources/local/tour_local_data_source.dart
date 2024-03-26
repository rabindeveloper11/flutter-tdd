import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/tour/data/models/tour_detail_model.dart';

abstract class TourLocalDataSource {
  Future<List<TourDetailModel>> getTours();
  Future<List<TourDetailModel>> search(String query);
  Future<void> saveTour(Map<String, dynamic> data);
  Future<void> deleteTour(int index);
}

class TourLocalDataSourceImpl implements TourLocalDataSource {
  final HiveService hiveService;

  TourLocalDataSourceImpl({required this.hiveService});
  @override
  Future<List<TourDetailModel>> getTours() async {
    List<TourDetailModel> tours = [];
    final data = await hiveService.getData(HiveService.savedTours);
    tours = data.map((e) {
      return TourDetailModel.fromJson(e);
    }).toList();
    return Future.value(tours);
  }

  @override
  Future<void> saveTour(Map<String, dynamic> data) async {
    await hiveService.addData(HiveService.savedTours, data);
  }

  @override
  Future<void> deleteTour(int index) async {
    await hiveService.deleteData(HiveService.savedTours, index);
  }

  @override
  Future<List<TourDetailModel>> search(String query) async {
    try {
      final data = await hiveService.getData(HiveService.savedPopular);

      final List<TourDetailModel> populars =
          data.map((e) => TourDetailModel.fromJson(e)).toList();

      final searchedPopulars = populars.where((element) {
        return element.title.contains(query);
      }).toList();

      return searchedPopulars;
    } catch (e) {
      throw ServerException();
    }
  }
}
