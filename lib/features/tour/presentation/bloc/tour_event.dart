import 'package:equatable/equatable.dart';

abstract class TourEvent extends Equatable {
  const TourEvent();

  @override
  List<Object> get props => [];
}

class GetTourDetailEvent extends TourEvent {
  const GetTourDetailEvent();

  @override
  List<Object> get props => [];
}
