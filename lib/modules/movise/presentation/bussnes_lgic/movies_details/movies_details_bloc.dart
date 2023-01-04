import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utilites/enum.dart';
import 'package:movies_app/modules/movise/domain/usecases/get_movie_recommindation_use_case.dart';
import 'package:movies_app/modules/movise/presentation/bussnes_lgic/movies_details/movies_details_state.dart';

import '../../../domain/usecases/get_movie_details_use_cases.dart';
import 'movies_details_event.dart';

class MoviesDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCases getMovieDetailsUseCases;
  final GetRecommendationUseCase getRecommendationUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCases, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetailsUseCases(
          MovieDetailsParameters(movieId: event.id));
      result.fold(
          (l) => emit(state.copyWith(
              movieDetailsMessage: l.message,
              movieDetailsState: RequestState.loaded)),
          (r) => emit(state.copyWith(
              movieDetail: r, movieDetailsState: RequestState.loaded)));
    });
    on<GetMovieRecommendationEvent>((event, emit) async {
      final result =
          await getRecommendationUseCase(RecommendationParameters(event.id));
      result.fold(
          (l) => emit(state.copyWith(
              recommendationMessage: l.message,
              recommendationState: RequestState.loaded)),
          (r) => emit(state.copyWith(
              recommendation: r, recommendationState: RequestState.loaded)));
    });
  }
}
