import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:movies_app/ui/home/viewmodels/popular_cubit.dart';
import 'package:movies_app/ui/home/viewmodels/popular_states.dart';

import '../../../core/config/app_constants/constants.dart';
import 'movie_poster_widgets.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  var popularCubit = PopularCubit();

  @override
  void initState() {
    super.initState();
    popularCubit.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularStates>(
        bloc: popularCubit,
        builder: (context, state) {
          switch (state) {
            case LoadingPopularStates():
              {
                print("********** loading");
                return const Expanded(
                  flex: 7,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

            case SuccessPopularStates():
              {
                final List<MoviePosterWidget> moviesPosters = state.popularList
                    .map((movie) => MoviePosterWidget(movie: movie))
                    .toList();
                print(state.popularList);
                return Expanded(
                    flex: 7,
                    child: FlutterCarousel(
                      items: moviesPosters,
                      options: CarouselOptions(
                        aspectRatio: 18 / 14,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        controller: CarouselController(),
                        pageSnapping: true,
                        scrollDirection: Axis.horizontal,
                        pauseAutoPlayOnTouch: true,
                        pauseAutoPlayOnManualNavigate: true,
                        pauseAutoPlayInFiniteScroll: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        disableCenter: false,
                        showIndicator: false,
                        //slideIndicator: const CircularSlideIndicator(currentIndicatorColor: Colors.black)
                      ),
                    ));
              }
            case ErrorPopularStates():
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
          }
        });
  }
}
