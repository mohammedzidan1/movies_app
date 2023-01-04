import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_cases/base_use_cases.dart';
import 'package:movies_app/core/utilites/enum.dart';


import '../../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      print(result);
      result.fold(
        (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
        (r) => emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());
      print(result);
      result.fold(
          (l) => emit(MoviesState(
              popularMessage: l.message, popularState: RequestState.error)),
          (r) => emit(MoviesState(
              popularMovies: r, popularState: RequestState.loaded)));
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParameters());

      print(result);
      result.fold(
        (l) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )),
        (r) => emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
