import 'package:get_it/get_it.dart';
import 'package:movie_app/features/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/data/repository/movies_repository.dart';
import 'package:movie_app/features/domain/repository/base_movie_repository.dart';
import 'package:movie_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_recommendation_movie_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_top_rate_movies_usecase..dart';
import 'package:movie_app/features/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app/features/presentation/controller/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///* Bloc:> MoviesBloc
    sl.registerFactory(() => MoviesBloc(
          getNowPlayingMoviesUseCase: sl(),
          getPopularMoviesUseCase: sl(),
          getTopRateMoviesUseCase: sl(),
        ));

    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    ///* usecase:> GetRecommendationMovieUsecase
    sl.registerLazySingleton(
        () => GetRecommendationMovieUsecase(baseMovieRepository: sl()));

    ///* usecase:> GetMovieDetailsUsecase
    sl.registerLazySingleton(
        () => GetMovieDetailsUsecase(baseMovieRepository: sl()));

    ///* usecase:> NowPlayingMovies
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));

    ///* usecase:> PopularMovies
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMovieRepository: sl()));

    ///* usecase:> TopRateMovies
    sl.registerLazySingleton(
        () => GetTopRateMoviesUseCase(baseMovieRepository: sl()));

    ///* Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    ///* Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
