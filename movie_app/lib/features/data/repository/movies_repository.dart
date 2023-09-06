// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/domain/entities/movie.dart';
import 'package:movie_app/features/domain/entities/movie_details.dart';
import 'package:movie_app/features/domain/entities/recommendation.dart';
import 'package:movie_app/features/domain/repository/base_movie_repository.dart';
import 'package:movie_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_recommendation_movie_usecase.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final res = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(res);
    } on ServerException catch (failure) {
      return left(ServerFailure(
          failureMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final res = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(res);
    } on ServerException catch (failure) {
      return left(ServerFailure(
          failureMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRateMovies() async {
    try {
      final res = await baseMovieRemoteDataSource.getTopRateMovies();
      return Right(res);
    } on ServerException catch (failure) {
      return left(ServerFailure(
          failureMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final res = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(res);
    } on ServerException catch (failure) {
      return left(ServerFailure(
          failureMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(
      RecommendationMovieParameters parameters) async {
    try {
      final res =
          await baseMovieRemoteDataSource.getRecommendationMovie(parameters);
      return Right(res);
    } on ServerException catch (failure) {
      return left(ServerFailure(
          failureMessage: failure.errorMessageModel.statusMessage));
    }
  }
}
