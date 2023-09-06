import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/core/util/enums.dart';
import 'package:movie_app/features/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/features/domain/usecases/get_top_rate_movies_usecase..dart';
import 'package:movie_app/features/presentation/controller/movies_bloc/movies_events.dart';
import 'package:movie_app/features/presentation/controller/movies_bloc/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRateMoviesUseCase getTopRateMoviesUseCase;

  MoviesBloc({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRateMoviesUseCase,
  }) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRateMoviesEvent>(_getTopRateMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingMessage: l.failureMessage,
              nowPlayingState: RequestState.error,
            )), (r) {
      debugPrint(
          "GetNowPlayingMoviesEvent list ${r.length} : ${state.nowPlayingMovies.length}");

      emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.failureMessage,
      ));
    }, (r) {
      debugPrint(
          "GetPopularMoviesEvent list ${r.length} : ${state.popularMovies.length}");

      emit(state.copyWith(
        popularState: RequestState.loaded,
        popularMovies: r,
      ));
    });
  }

  FutureOr<void> _getTopRateMovies(
    GetTopRateMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRateMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        topRateState: RequestState.error,
        topRateMessage: l.failureMessage,
      ));
    }, (r) {
      debugPrint(
          "GetTopRateMoviesEvent list ${r.length} : ${state.topRateMovies.length}");
      emit(state.copyWith(
        topRateState: RequestState.loaded,
        topRateMovies: r,
      ));
    });
  }
}
