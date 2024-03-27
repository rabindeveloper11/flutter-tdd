import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';

abstract class TourRepository { 
  Future<Either<Failure, TourDetailEntity>> getTourDetail(); 
}