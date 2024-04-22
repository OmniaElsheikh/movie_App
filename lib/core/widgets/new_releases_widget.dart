import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_constants/constants.dart';
import 'package:movies_app/core/widgets/cashed_network_image_widget.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';

class NewReleasesWidget extends StatelessWidget {
  final MovieModel movieModel;

  const NewReleasesWidget({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CashedNetworkImageWidget(
            image: Constants.imageBaseUrl + movieModel.poster_path),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 33,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset("assets/images/add_background.png",
                            fit: BoxFit.cover)
                        .image)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
