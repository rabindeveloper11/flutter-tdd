import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/features/home/domain/repositories/popular_repository.dart';

class GetAllPopularUsecase {  
  final PopularRepository repository;  

  const GetAllPopularUsecase(this.repository); 

  Future<Either<Failure, List<PopularEntity>>> call() async {
    return repository.getAllPopular();
  }

  
  
}