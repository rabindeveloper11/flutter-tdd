import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';
import 'package:flutter_assesment/features/tour/domain/repositories/tour_repository.dart';

class GetTourDetailUseCase { 
  final TourRepository repository; 

  GetTourDetailUseCase(this.repository);

  Future<Either<Failure, TourDetailEntity>> call() async {
    return repository.getTourDetail();
  }
  
}