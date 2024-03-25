import 'package:equatable/equatable.dart';

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