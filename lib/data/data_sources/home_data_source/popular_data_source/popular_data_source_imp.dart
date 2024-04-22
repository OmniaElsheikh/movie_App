import 'package:movies_app/data/data_sources/home_data_source/popular_data_source/popular_data_source.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';
import 'package:movies_app/data/network/api_manager.dart';

class PopularDataSourceImp extends PopularDataSource {
  final ApiManager apiManager;

  PopularDataSourceImp({required this.apiManager});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    return await apiManager.getPopularMovies();
  }
}
