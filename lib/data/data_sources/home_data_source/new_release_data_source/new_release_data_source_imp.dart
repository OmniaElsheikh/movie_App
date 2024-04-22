import 'package:movies_app/data/models/home_models/movie_model.dart';
import 'package:movies_app/data/network/api_manager.dart';

import 'new_release_data_source.dart';

class NewReleaseDataSourceImp extends NewReleaseDataSource {
  final ApiManager apiManager;

  NewReleaseDataSourceImp({required this.apiManager});

  @override
  Future<List<MovieModel>> getNewRelease() async {
    return await apiManager.getNewRelease();
  }
}
