import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';

abstract class PopularRepository {
  Future<Either<Failure, List<PopularEntity>>> getAllPopular();
    Future<Either<Failure, List<PopularEntity>>> search(String query);
}
