import 'package:equatable/equatable.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';

abstract class TourState extends Equatable {
  const TourState();

  @override
  List<Object> get props => [];
}

class TourInitial extends TourState {}

class TourLoading extends TourState {}

class TourLoaded extends TourState {
  final TourDetailEntity tourDetailEntity;

  const TourLoaded({required this.tourDetailEntity});

  @override
  List<Object> get props => [tourDetailEntity];
} 

class TourError extends TourState {
  final String message;

  const TourError({required this.message});

  @override
  List<Object> get props => [message];
}
