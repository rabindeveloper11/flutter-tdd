import 'package:equatable/equatable.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<PopularEntity> populars;

  const PopularLoaded({required this.populars});

  @override
  List<Object> get props => [populars];
}

class PopularError extends PopularState {
  final String message;

  const PopularError({required this.message});

  @override
  List<Object> get props => [message];
}
