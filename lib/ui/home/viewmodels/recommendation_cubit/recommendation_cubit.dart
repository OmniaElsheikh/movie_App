import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';
import 'package:movies_app/ui/home/viewmodels/recommendation_cubit/recommendation_states.dart';

import '../../../../data/data_sources/home_data_source/recommendation_data_source/recommendation_data_source.dart';
import '../../../../data/data_sources/home_data_source/recommendation_data_source/recommendation_data_source_imp.dart';
import '../../../../data/network/api_manager.dart';
import '../../../../data/repositories_imp/recommendation_repository_imp.dart';
import '../../../../repositories/recommendation_repository.dart';

class RecommendationCubit extends Cubit<RecommendationStates> {
  late RecommendationRepository recommendationRepository;
  late RecommendationDataSource recommendationDataSource;
  late ApiManager apiManager;

  RecommendationCubit() : super(LoadingRecommendationStates());

  getRecommendationMovies() async {
    apiManager = ApiManager();
    recommendationDataSource =
        RecommendationDataSourceImp(apiManager: apiManager);
    recommendationRepository =
        RecommendationRepositoryImp(recommendationDataSource);
    emit(LoadingRecommendationStates());
    try {
      List<MovieModel> RecommendationList =
          await recommendationRepository.getRecommendationMovies();
      emit(SuccessRecommendationStates(RecommendationList));
    } catch (message) {
      emit(ErrorRecommendationStates(message.toString()));
    }
  }
}
