import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_cases/base_use_cases.dart';
import 'package:movies_app/modules/movise/domain/entites/movie_details.dart';
import 'package:movies_app/modules/movise/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCases  extends BaseUseCases<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;


  GetMovieDetailsUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
