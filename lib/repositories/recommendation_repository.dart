import 'package:movies_app/data/models/home_models/movie_model.dart';

abstract class RecommendationRepository {
  Future<List<MovieModel>> getRecommendationMovies();
}
