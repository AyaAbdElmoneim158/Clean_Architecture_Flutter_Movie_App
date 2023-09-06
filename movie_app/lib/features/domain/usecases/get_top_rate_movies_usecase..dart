// ignore_for_file: file_names
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/features/domain/entities/movie.dart';
import 'package:movie_app/features/domain/repository/base_movie_repository.dart';

class GetTopRateMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  BaseMovieRepository baseMovieRepository;
  GetTopRateMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async =>
      await baseMovieRepository.getTopRateMovies();
}
