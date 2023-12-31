/*import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetRecommendationMovieEvent extends MovieDetailsEvent {
  final int id;
  const GetRecommendationMovieEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
*/
import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
