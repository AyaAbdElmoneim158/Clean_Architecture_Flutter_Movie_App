import 'package:dio/dio.dart';
import 'package:movie_app/features/data/models/movie_details_model.dart';
import 'package:movie_app/features/data/models/movie_model.dart';
import 'package:movie_app/features/data/models/recommendation_model.dart';
import 'package:movie_app/features/domain/entities/movie.dart';
import 'package:movie_app/features/domain/entities/recommendation.dart';
import 'package:movie_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_recommendation_movie_usecase.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRateMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<Recommendation>> getRecommendationMovie(
      RecommendationMovieParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    Response response = await Dio().get(ApiConstants.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(((response.data["results"]) as List).map(
          (e) => MovieModel.fromJson(
              e))); // :> list.form -> Creates a list containing all elements.
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    Response response = await Dio().get(ApiConstants.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(((response.data["results"]) as List).map(
          (e) => MovieModel.fromJson(
              e))); // :> list.form -> Creates a list containing all elements.
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getTopRateMovies() async {
    Response response = await Dio().get(ApiConstants.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(((response.data["results"]) as List).map(
          (e) => MovieModel.fromJson(
              e))); // :> list.form -> Creates a list containing all elements.
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    Response response =
        await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getRecommendationMovie(
      RecommendationMovieParameters parameters) async {
    Response response =
        await Dio().get(ApiConstants.recommendPath(parameters.movieId));

    if (response.statusCode == 200) {
      return List<Recommendation>.from(((response.data["results"]) as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
