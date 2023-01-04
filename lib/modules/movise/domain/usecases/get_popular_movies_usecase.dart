import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movise/domain/entites/movie.dart';
import 'package:movies_app/modules/movise/domain/repository/base_movies_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/base_use_cases.dart';

class GetPopularMoviesUseCase  extends BaseUseCases<List<Movie>,NoParameters>{
  BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters)async {
    return await baseMoviesRepository.getPopularMovies();
  }


}
