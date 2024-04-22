import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/viewmodels/popular_cubit.dart';
import 'package:movies_app/ui/home/widgets/new_release_list.dart';
import 'package:movies_app/ui/home/widgets/recommended_list.dart';

import '../widgets/carousel_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PopularCubit popularCubit = PopularCubit();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CarouselWidget(),
        SizedBox(
          height: 20,
        ),
        NewReleaseList(),
        SizedBox(
          height: 25,
        ),
        RecommendedList()
      ],
    );
  }
}
