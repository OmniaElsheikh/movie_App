import '../../../data/models/home_models/movie_model.dart';

sealed class PopularStates {}

class LoadingPopularStates extends PopularStates {}

class SuccessPopularStates extends PopularStates {
  final List<MovieModel> popularList;

  SuccessPopularStates(this.popularList);
}

class ErrorPopularStates extends PopularStates {
  final String message;

  ErrorPopularStates(this.message);
}
