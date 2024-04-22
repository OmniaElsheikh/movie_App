import 'package:movies_app/data/models/home_models/movie_model.dart';

abstract class NewReleaseRepository {
  Future<List<MovieModel>> getNewRelease();
}
