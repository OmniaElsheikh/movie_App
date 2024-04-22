import 'package:movies_app/data/data_sources/home_data_source/popular_data_source/popular_data_source.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';
import 'package:movies_app/repositories/popular_repository.dart';

class PopularRepositoryImp extends PopularRepository {
  final PopularDataSource popularDataSource;

  PopularRepositoryImp(this.popularDataSource);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    return await popularDataSource.getPopularMovies();
  }
}
