import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';

class Constants {
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static const apiKey = "f6c8e791c6ade9fa52998a6f93e2fd76";
  static const accessToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNzFmOTdjNGJhYzI4MGM3NjQyYzQxYzFiOTIyNjMyOCIsInN1YiI6IjY2MGUzYmFhZTAzOWYxMDE3Y2U4NmI0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Qvl_PCSbQ20JI4zTohGxM-toqTFUXhUV1ocWw3Z5k-I";
  static const baseUrl = "api.themoviedb.org";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/original";
}
