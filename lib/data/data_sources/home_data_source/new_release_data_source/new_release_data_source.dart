import 'package:movies_app/data/models/home_models/movie_model.dart';

abstract class NewReleaseDataSource {
  Future<List<MovieModel>> getNewRelease();
}
