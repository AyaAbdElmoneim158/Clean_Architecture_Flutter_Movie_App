import 'package:equatable/equatable.dart';
import 'package:movie_app/features/domain/entities/movie_details.dart';
import 'package:movie_app/features/domain/entities/recommendation.dart';
import '../../../../core/util/enums.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  final MovieDetails? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
