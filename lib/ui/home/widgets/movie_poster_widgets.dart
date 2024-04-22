import 'package:flutter/material.dart';
import 'package:movies_app/core/config/styles/app_colors.dart';
import 'package:movies_app/core/widgets/new_releases_widget.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';

import '../../../core/config/app_constants/constants.dart';
import '../../../core/widgets/poster_widget.dart';

class MoviePosterWidget extends StatelessWidget {
  final MovieModel movie;

  const MoviePosterWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: PosterWidget(
                image: Constants.imageBaseUrl + movie.backdrop_path)),
        Positioned(
          bottom: 0,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            const SizedBox(
              width: 8,
            ),
            Container(
                height: 180,
                width: 140,
                child: NewReleasesWidget(movieModel: movie)),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  movie.title,
                  style: Constants.theme.textTheme.labelSmall!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  movie.release_date,
                  style: Constants.theme.textTheme.displayLarge!
                      .copyWith(color: AppColors.displayColor),
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
