import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final res = await remoteDataSource.getCategories();

      return Right(res);
    } on SocketException {
      return const Left(ConnectionFailure(message: 'No Internet Connection'));
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Error'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> search(String query) async {
    try {
      final res = await remoteDataSource.search(query);

      return Right(res);
    } on SocketException {
      return const Left(ConnectionFailure(message: 'No Internet Connection'));
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Error'));
    }
  }
}
