import '../../../../data/models/home_models/movie_model.dart';

sealed class RecommendationStates {}

class LoadingRecommendationStates extends RecommendationStates {}

class SuccessRecommendationStates extends RecommendationStates {
  final List<MovieModel> recommendationList;

  SuccessRecommendationStates(this.recommendationList);
}

class ErrorRecommendationStates extends RecommendationStates {
  final String message;

  ErrorRecommendationStates(this.message);
}
