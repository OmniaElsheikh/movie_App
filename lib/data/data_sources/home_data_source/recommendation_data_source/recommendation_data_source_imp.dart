import 'package:movies_app/data/data_sources/home_data_source/recommendation_data_source/recommendation_data_source.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';
import 'package:movies_app/data/network/api_manager.dart';

class RecommendationDataSourceImp extends RecommendationDataSource {
  final ApiManager apiManager;

  RecommendationDataSourceImp({required this.apiManager});

  @override
  Future<List<MovieModel>> getRecommendationsMovies() async {
    return await apiManager.getRecommendation();
  }
}
