import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_popular.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetAllPopularUsecase getAllPopularUseCase;

  PopularBloc({required this.getAllPopularUseCase})
      : super(PopularInitial()) {
    on<GetPopularsEvent>((event, emit) async {
      emit(PopularLoading());
      final result = await getAllPopularUseCase.call();
      result.fold(
        (failure) => emit(PopularError(message: failure.message)),
        (r) => emit(
          PopularLoaded(categories:r ),
        ),
      );
    });
  }
}
