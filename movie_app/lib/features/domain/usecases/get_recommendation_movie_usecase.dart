import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/features/domain/entities/recommendation.dart';
import 'package:movie_app/features/domain/repository/base_movie_repository.dart';

class GetRecommendationMovieUsecase
    extends BaseUseCase<List<Recommendation>, RecommendationMovieParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationMovieUsecase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationMovieParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovie(parameters);
  }
}

class RecommendationMovieParameters extends Equatable {
  final int movieId;
  const RecommendationMovieParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
