import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/features/home/domain/repositories/popular_repository.dart';

class GetAllPopularUsecase {
  final PopularRepository repository;

  const GetAllPopularUsecase(this.repository);

  /// gets inital data of populars
  Future<Either<Failure, List<PopularEntity>>> call() async {
    return repository.getAllPopular();
  }

  /// searches for the product
  Future<Either<Failure, List<PopularEntity>>> search(String query) async {
    return repository.search(query);
  }
}
