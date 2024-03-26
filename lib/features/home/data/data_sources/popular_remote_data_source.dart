import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/config/dummy_data/popular_dummy_data.dart';
import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/core/helpers/list_unique_checker.dart';
import 'package:flutter_assesment/features/home/data/data_sources/local/popular_local_data_source.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:flutter_assesment/service_locator.dart';
import 'package:http/http.dart' as http;

abstract class PopularRemoteDataSource {
  Future<List<PopularModel>> getPopulars();
  Future<List<PopularModel>> search(String query);
}

class PopularRemoteDataSourceImpl implements PopularRemoteDataSource {
  final http.Client client;

  PopularRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PopularModel>> getPopulars() async {
    /// this is a dummy request to the server, which will return the information of
    /// passing the empty url to the string because of the fact that the UI and
    /// the public API are not quite a match ( as per initial research)
    ///
    ///
    final response =
        await client.get(Uri.parse('https://rabinacharya.info.np'));

    /// converting into the model and returning the list of popular from here
    if (response.statusCode == 200) {
      /// converting into the model and returning the list of popular from here
      /// currently assuming that the modeling is done correctly
      /// and the response is also correct
      /// returning the empty list of popular for now
      ///
      ///

      /// saving the data to local storage
      ///

      /// clearing the previous data
      await locator<HiveService>().clearBox(HiveService.savedPopular);

      ///
      for (var popular in popularDummyData) {
        final isUnique = ListUniqueChecker.isUnique(
          await locator<PopularLocalDataSourceImpl>().getSavedPopulars(),
          popular,
        );
        if (isUnique) {
          await locator<PopularLocalDataSourceImpl>()
              .savePopular(popular.toJson());
        }
      }

      /// here we can carry out the mapping of the response to the model
      /// since the api that are required my the UI are is not found with the
      /// initial research, we are returning the empty list of popular
      return popularDummyData;
    } else {
      /// we are throwing the ServerException in case of any error from the server
      /// we can also throw the custom exception here
      throw ServerException();
    }
  }

  @override
  Future<List<PopularModel>> search(String query) async {
    /// mocking the real server request delay in real api scenario
    searchFromList() async {
      List<PopularModel> products = [];
      final data = await PopularLocalDataSourceImpl(hiveService: locator())
          .getSavedPopulars();

      for (final singleData in data) {
        if (singleData.title.toLowerCase().contains(
              query.toLowerCase(),
            )) {
          products.add(singleData);
        }
      }

      return products;
    }

    return searchFromList();
  }
}
