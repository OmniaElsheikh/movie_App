import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/config/app_constants/constants.dart';
import 'package:movies_app/data/models/home_models/movie_model.dart';

class ApiManager {
  Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMoviesList = [];
    Map<String, String>? queryParams = {"Authorization": Constants.accessToken};
    Uri uri = Uri.https(Constants.baseUrl, "/3/movie/popular");
    var response = await http.get(uri, headers: queryParams);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var popularMoviesJson = data["results"];
      print(popularMoviesJson);

      for (var element in popularMoviesJson) {
        popularMoviesList.add(MovieModel.init(element));
      }
      return popularMoviesList;
    } else {
      var data = jsonDecode(response.body);
      var error = data["status_message"];
      throw Exception(error);
    }
  }

  Future<List<MovieModel>> getNewRelease() async {
    List<MovieModel> newReleaseList = [];
    Map<String, String>? queryParams = {"Authorization": Constants.accessToken};
    Uri uri = Uri.https(Constants.baseUrl, "/3/movie/upcoming");
    var response = await http.get(uri, headers: queryParams);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var newReleaseJson = data["results"];

      for (var element in newReleaseJson) {
        newReleaseList.add(MovieModel.init(element));
      }
      return newReleaseList;
    } else {
      var data = jsonDecode(response.body);
      var error = data["status_message"];
      throw Exception(error);
    }
  }

  Future<List<MovieModel>> getRecommendation() async {
    List<MovieModel> recommendationList = [];
    Map<String, String>? queryParams = {"Authorization": Constants.accessToken};
    Uri uri = Uri.https(Constants.baseUrl, "/3/movie/top_rated");
    var response = await http.get(uri, headers: queryParams);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var newReleaseJson = data["results"];

      for (var element in newReleaseJson) {
        recommendationList.add(MovieModel.init(element));
      }
      return recommendationList;
    } else {
      var error = data["status_message"];
      throw Exception(error);
    }
  }

  static Future<List<MovieModel>> fetchCategoryData(String categoryId) async {
    List<MovieModel> moviesDataList = [];
    Map<String, dynamic>? queryParams = {
      "api_key": Constants.apiKey,
      "genre_ids": categoryId
    };
    //List genreIds=[];
    Uri uri = Uri.https(Constants.baseUrl, "/3/discover/movie", queryParams /**/
        );
    var response = await http.get(
      uri,
      //headers: queryParams
    );

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List moviesList = data["genre_ids"];
      //List genreIds = data["results[genre_ids]"];

      for (var element in moviesList) {
        moviesDataList.add(MovieModel.init(element));
      }
      return moviesDataList;
    } else {
      var error = data["status_message"];
      throw Exception(error);
    }
  }
}
