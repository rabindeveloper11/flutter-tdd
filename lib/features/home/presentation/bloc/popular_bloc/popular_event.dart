import 'package:equatable/equatable.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}

class GetPopularsEvent extends PopularEvent {
  const GetPopularsEvent();

  @override
  List<Object> get props => [];
}

class SeachPopularsEvent extends PopularEvent {
  final String query;

  const SeachPopularsEvent(this.query);

  @override
  List<Object> get props => [query];
}

/// event to toggle favorite status of a popular

class ToggleFavoriteEvent extends PopularEvent {
  final PopularEntity entity;

  const ToggleFavoriteEvent(this.entity);

  @override
  List<Object> get props => [entity];
}


