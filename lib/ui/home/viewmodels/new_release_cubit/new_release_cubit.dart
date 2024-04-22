import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';

import '../../../../data/data_sources/home_data_source/new_release_data_source/new_release_data_source.dart';
import '../../../../data/data_sources/home_data_source/new_release_data_source/new_release_data_source_imp.dart';
import '../../../../data/network/api_manager.dart';
import '../../../../data/repositories_imp/new_release_repository_imp.dart';
import '../../../../repositories/new_release_repository.dart';
import 'new_release_states.dart';

class NewReleaseCubit extends Cubit<NewReleaseStates> {
  late NewReleaseRepository newReleaseRepository;
  late NewReleaseDataSource newReleaseDataSource;
  late ApiManager apiManager;

  NewReleaseCubit() : super(LoadingNewReleaseStates());

  getNewReleaseMovies() async {
    apiManager = ApiManager();
    newReleaseDataSource = NewReleaseDataSourceImp(apiManager: apiManager);
    newReleaseRepository = NewReleaseRepositoryImp(newReleaseDataSource);
    emit(LoadingNewReleaseStates());
    try {
      List<MovieModel> newReleaseList =
          await newReleaseRepository.getNewRelease();
      print("list --->${newReleaseList.length}");
      emit(SuccessNewReleaseStates(newReleaseList));
    } catch (message) {
      print("message --->${message}");
      emit(ErrorNewReleaseStates(message.toString()));
    }
  }
}
