import 'package:movies_app/data/models/home_models/movie_model.dart';

import '../../repositories/recommendation_repository.dart';
import '../data_sources/home_data_source/recommendation_data_source/recommendation_data_source.dart';

class RecommendationRepositoryImp extends RecommendationRepository {
  final RecommendationDataSource recommendationDataSource;

  RecommendationRepositoryImp(this.recommendationDataSource);

  @override
  Future<List<MovieModel>> getRecommendationMovies() async {
    return await recommendationDataSource.getRecommendationsMovies();
  }
}
