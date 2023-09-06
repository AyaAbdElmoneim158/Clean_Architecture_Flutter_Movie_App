import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/features/domain/entities/movie.dart';
import 'package:movie_app/features/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  BaseMovieRepository baseMovieRepository;
  GetNowPlayingMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
