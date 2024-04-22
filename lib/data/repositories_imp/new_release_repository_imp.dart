import 'package:movies_app/repositories/new_release_repository.dart';

import '../data_sources/home_data_source/new_release_data_source/new_release_data_source.dart';
import '../models/home_models/movie_model.dart';

class NewReleaseRepositoryImp extends NewReleaseRepository {
  final NewReleaseDataSource newReleaseDataSource;

  NewReleaseRepositoryImp(this.newReleaseDataSource);

  @override
  Future<List<MovieModel>> getNewRelease() async {
    return await newReleaseDataSource.getNewRelease();
  }
}
