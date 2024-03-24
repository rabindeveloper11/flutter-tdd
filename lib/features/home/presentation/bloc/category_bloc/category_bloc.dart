import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoriesUserCase getAllCategoriesUserCase;

  CategoryBloc({required this.getAllCategoriesUserCase})
      : super(CategoryInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoryLoading());
      final result = await getAllCategoriesUserCase.call();
      result.fold(
        (failure) => emit(CategoryError(message: failure.message)),
        (r) => emit(
          CategoryLoaded(categories: r),
        ),
      );

      
    });
  }
}
