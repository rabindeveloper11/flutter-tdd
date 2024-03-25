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
