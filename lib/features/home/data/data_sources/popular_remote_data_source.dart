import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:http/http.dart' as http;

abstract class PopularRemoteDataSource {
  Future<List<PopularModel>> getPopulars();
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
    final response = await client.get(Uri.parse(''));

    /// converting into the model and returning the list of popular from here

    if (response.statusCode == 200) {
      /// converting into the model and returning the list of popular from here
      /// currently assuming that the modeling is done correctly
      /// and the response is also correct
      /// returning the empty list of popular for now
      ///
      final List<PopularModel> populars = [];

      /// here we can carry out the mapping of the response to the model
      /// since the api that are required my the UI are is not found with the
      /// initial research, we are returning the empty list of popular
      return populars;
    } else {
      /// we are throwing the ServerException in case of any error from the server
      /// we can also throw the custom exception here
      throw ServerException();
    }
  }
}
