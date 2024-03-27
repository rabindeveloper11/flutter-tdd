import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/tour/data/data-sources/tour_detail_data_source.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient client;
  late TourRemoteDetailDataSource dataSource;

  setUp(() {
    client = MockHttpClient();
    dataSource = TourRemoteDetailDataSourceImpl(client: client);
  });

  group('Tour Detail Data Source Test', () {
    test('Testing for the tour detail when response is 200', () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(
          'dummy data',
          200,
        ),
      );

      final result = await dataSource.getTourDetail();

      expect(result, isA<TourDetailEntity>());
    });

    test('Testing for the tour detail when the response is not 200', () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(
          'Error occurred',
          404,
        ),
      );

      expect(
        () async => dataSource.getTourDetail(),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
