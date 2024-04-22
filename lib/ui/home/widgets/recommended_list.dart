import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_constants/constants.dart';
import '../../../core/config/styles/app_colors.dart';
import '../../../core/widgets/recommended_item.dart';
import '../viewmodels/recommendation_cubit/recommendation_cubit.dart';
import '../viewmodels/recommendation_cubit/recommendation_states.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  RecommendationCubit recommendationCubit = RecommendationCubit();

  @override
  void initState() {
    super.initState();
    recommendationCubit.getRecommendationMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationStates>(
        bloc: recommendationCubit,
        builder: (context, state) {
          switch (state) {
            case LoadingRecommendationStates():
              {
                return const Expanded(
                  flex: 7,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

            case ErrorRecommendationStates():
              {
                return Expanded(
                  flex: 7,
                  child: Center(
                    child: Text(
                      "Some Thing went wrong ",
                      style: Constants.theme.textTheme.bodyMedium,
                    ),
                  ),
                );
              }

            case SuccessRecommendationStates():
              return Expanded(
                  flex: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    color: AppColors.onPrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended",
                          style: Constants.theme.textTheme.bodySmall,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return RecommendedItemWidget(
                                  model: state.recommendationList[index]);
                            },
                            itemCount: state.recommendationList.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ));
          }
        });
  }
}
