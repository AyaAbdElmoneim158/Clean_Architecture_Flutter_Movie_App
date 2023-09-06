import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/domain/entities/movie.dart';
import 'package:movie_app/features/domain/entities/movie_details.dart';
import 'package:movie_app/features/domain/entities/recommendation.dart';
import 'package:movie_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_recommendation_movie_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRateMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(
      RecommendationMovieParameters parameters);
}
