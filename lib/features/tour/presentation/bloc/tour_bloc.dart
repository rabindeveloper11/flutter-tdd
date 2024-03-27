import 'package:flutter_assesment/features/tour/domain/usecases/get_tour_detail.dart';
import 'package:flutter_assesment/features/tour/presentation/bloc/tour_event.dart';
import 'package:flutter_assesment/features/tour/presentation/bloc/tour_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  final GetTourDetailUseCase _getTourDetailUseCase;
  TourBloc(this._getTourDetailUseCase) : super(TourInitial()) {
    on<GetTourDetailEvent>((event, emit) async {
      emit(TourLoading());
      final result = await _getTourDetailUseCase.call();
      result.fold(
        (failure) => emit(TourError(message: failure.message)),
        (r) => emit(
          TourLoaded(tourDetailEntity: r),
        ),
      );
    });
  }
}
