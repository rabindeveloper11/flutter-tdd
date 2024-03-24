import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/data/data_sources/popular_remote_data_source.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/features/home/domain/repositories/popular_repository.dart';

class PopularRepositoryImpl implements PopularRepository {
  final PopularRemoteDataSource remoteDataSource;
  PopularRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<PopularEntity>>> getAllPopular() async {
    try {
      final res = await remoteDataSource.getPopulars();
      return Right(res);
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure(message: 'No Internet Connections'));
    }
  }
}
