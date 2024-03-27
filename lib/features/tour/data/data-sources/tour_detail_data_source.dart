import 'package:flutter_assesment/config/dummy_data/tour_detail_dummy_data.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';

import 'package:http/http.dart' as http;

abstract class TourRemoteDetailDataSource {
  Future<TourDetailEntity> getTourDetail();
}

class TourRemoteDetailDataSourceImpl implements TourRemoteDetailDataSource {
  final http.Client client;

  TourRemoteDetailDataSourceImpl({required this.client});

  @override
  Future<TourDetailEntity> getTourDetail() async {
    final res = await client.get(Uri.parse('https://rabinacharya.info.np'));

    if (res.statusCode == 200) {
      /// this  is the dummy data that is returned from the server

      return tourDetailData;
    } else {
      throw ServerException();
    }
  }
}
