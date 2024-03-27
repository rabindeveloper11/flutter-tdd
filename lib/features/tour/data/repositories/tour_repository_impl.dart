import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/tour/data/data-sources/tour_detail_data_source.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';
import 'package:flutter_assesment/features/tour/domain/repositories/tour_repository.dart';

class TourRepositoryImpl implements TourRepository {
  final TourRemoteDetailDataSource remoteDataSource;

  TourRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, TourDetailEntity>> getTourDetail() async {
    try {
      final response = await remoteDataSource.getTourDetail();
      return Right(response);
    } on ServerException {
      throw ServerException();
    }
  }
}
