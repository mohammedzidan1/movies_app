import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/movise/domain/usecases/get_movie_details_use_cases.dart';
import 'package:movies_app/modules/movise/presentation/bussnes_lgic/movies_details/movies_details_bloc.dart';

import '../../modules/movise/data/data_source/movie_remote_data_source.dart';
import '../../modules/movise/data/repository/movies_repository.dart';
import '../../modules/movise/domain/repository/base_movies_repository.dart';
import '../../modules/movise/domain/usecases/get_movie_recommindation_use_case.dart';
import '../../modules/movise/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../modules/movise/domain/usecases/get_popular_movies_usecase.dart';
import '../../modules/movise/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../modules/movise/presentation/bussnes_lgic/main_movies/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(),sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCases(sl()));
     sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
