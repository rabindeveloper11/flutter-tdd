import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoriesUserCase _getAllCategoriesUserCase;

  CategoryBloc(this._getAllCategoriesUserCase) : super(CategoryInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoryLoading());
      final result = await _getAllCategoriesUserCase.call();
      result.fold(
        (failure) => emit(CategoryError(message: failure.message)),
        (r) => emit(
          CategoryLoaded(categories: r),
        ),
      );
    });

    on<SearchCategoriesEvent>(
      (event, emit) async {
        emit(CategoryLoading());

        final result = await _getAllCategoriesUserCase.search(event.query);

        result.fold(
          (failure) => emit(CategoryError(message: failure.message)),
          (r) => emit(
            CategoryLoaded(categories: r),
          ),
        );
      },
    );
  }
}
