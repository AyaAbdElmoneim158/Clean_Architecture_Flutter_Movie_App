// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/util/enums.dart';
import 'package:movie_app/features/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRateMovies;

  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRateState;

  final String nowPlayingMessage;
  final String popularMessage;
  final String topRateMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRateMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.popularState = RequestState.loading,
    this.topRateState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMessage = '',
    this.topRateMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRateMovies,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRateState,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRateMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRateMovies: topRateMovies ?? this.topRateMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularState: popularState ?? this.popularState,
      topRateState: topRateState ?? this.topRateState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRateMessage: topRateMessage ?? this.topRateMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      nowPlayingMovies,
      popularMovies,
      topRateMovies,
      nowPlayingState,
      popularState,
      topRateState,
      nowPlayingMessage,
      popularMessage,
      topRateMessage,
    ];
  }
}
