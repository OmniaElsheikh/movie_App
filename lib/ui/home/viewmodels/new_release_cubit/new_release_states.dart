import '../../../../data/models/home_models/movie_model.dart';

sealed class NewReleaseStates {}

class LoadingNewReleaseStates extends NewReleaseStates {}

class SuccessNewReleaseStates extends NewReleaseStates {
  final List<MovieModel> newReleaseList;

  SuccessNewReleaseStates(this.newReleaseList);
}

class ErrorNewReleaseStates extends NewReleaseStates {
  final String message;

  ErrorNewReleaseStates(this.message);
}
