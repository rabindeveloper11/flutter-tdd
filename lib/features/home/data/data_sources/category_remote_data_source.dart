import 'package:flutter_assesment/config/dummy_data/category_dummy_data.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> search(String query);
}

class CategorySourceDataImpl implements CategoryRemoteDataSource {
  final http.Client client;

  CategorySourceDataImpl({required this.client});

  @override
  Future<List<CategoryModel>> getCategories() async {
    /// this is a dummy request to the server, which will return the information of
    /// passing the empty url to the string because of the fact that the UI and
    /// the public API are not quite a match ( as per initial research)
    final response =
        await client.get(Uri.parse('https://rabinacharya.info.np'));

    if (response.statusCode == 200) {
      /// converting into the model and returning the list of categories from here
      /// currently assuming that the modeling is done correctly
      /// and the response is also correct
      /// returning the empty list of categories for now
      ///

      /// here we can carry out the mapping of the response to the model
      /// since the api that are required my the UI are is not found with the
      /// initial research, we are returning the empty list of categories

      return dummyCategories;
    } else {
      /// we are throwing the ServerException in case of any error from the server
      /// we can also throw the custom exception here
      throw ServerException();
    }
  }

  @override
  Future<List<CategoryModel>> search(String query) {
    searchFromList() async {
      final products = dummyCategories.where((element) {
        return element.name.contains(query);
      }).toList();
      return products;
    }

    return searchFromList();
  }
}
