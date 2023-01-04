import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movise/domain/entites/recommindation.dart';
import 'package:movies_app/modules/movise/domain/usecases/get_movie_details_use_cases.dart';
import 'package:movies_app/modules/movise/domain/usecases/get_movie_recommindation_use_case.dart';

import '../../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../entites/movie_details.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getMoviesRecommendation(RecommendationParameters parameters);
}
