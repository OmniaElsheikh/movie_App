import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/viewmodels/new_release_cubit/new_release_cubit.dart';

import '../../../core/config/app_constants/constants.dart';
import '../../../core/config/styles/app_colors.dart';
import '../../../core/widgets/new_releases_widget.dart';
import '../viewmodels/new_release_cubit/new_release_states.dart';

class NewReleaseList extends StatefulWidget {
  const NewReleaseList({super.key});

  @override
  State<NewReleaseList> createState() => _NewReleaseListState();
}

class _NewReleaseListState extends State<NewReleaseList> {
  NewReleaseCubit newReleaseCubit = NewReleaseCubit();

  @override
  void initState() {
    super.initState();
    newReleaseCubit.getNewReleaseMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleaseCubit, NewReleaseStates>(
        bloc: newReleaseCubit,
        builder: (context, state) {
          switch (state) {
            case LoadingNewReleaseStates():
              {
                return const Expanded(
                  flex: 7,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

            case ErrorNewReleaseStates():
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

            case SuccessNewReleaseStates():
              {
                return Expanded(
                    flex: 4,
                    child: Container(
                      color: AppColors.onPrimaryColor,
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Releases ",
                            style: Constants.theme.textTheme.bodySmall,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                    width: 110,
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 8),
                                    child: NewReleasesWidget(
                                        movieModel:
                                            state.newReleaseList[index]));
                              },
                              itemCount: state.newReleaseList.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ));
              }
          }
        });
  }
}
