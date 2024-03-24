import 'package:equatable/equatable.dart';
import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  const CategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
} 

class CategoryError extends CategoryState {
  final String message;

  const CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
