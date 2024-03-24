import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent(); 

  @override
  List<Object> get props => [];
}
 

 class GetCategoriesEvent extends CategoryEvent {
  const GetCategoriesEvent(); 

  @override
  List<Object> get props => [];
}