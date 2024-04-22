import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/data_sources/home_data_source/popular_data_source/popular_data_source_imp.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';
import 'package:movies_app/data/repositories_imp/popular_repository_imp.dart';
import 'package:movies_app/ui/home/viewmodels/popular_states.dart';

import '../../../data/data_sources/home_data_source/popular_data_source/popular_data_source.dart';
import '../../../data/network/api_manager.dart';
import '../../../repositories/popular_repository.dart';

class PopularCubit extends Cubit<PopularStates> {
  late PopularRepository popularRepository;
  late PopularDataSource popularDataSource;
  late ApiManager apiManager;

  PopularCubit() : super(LoadingPopularStates());

  getPopularMovies() async {
    apiManager = ApiManager();
    popularDataSource = PopularDataSourceImp(apiManager: apiManager);
    popularRepository = PopularRepositoryImp(popularDataSource);
    emit(LoadingPopularStates());
    try {
      List<MovieModel> popularList = await popularRepository.getPopularMovies();
      print("list --->${popularList.length}");
      emit(SuccessPopularStates(popularList));
    } catch (message) {
      print("message --->${message}");
      emit(ErrorPopularStates(message.toString()));
    }
  }
}
