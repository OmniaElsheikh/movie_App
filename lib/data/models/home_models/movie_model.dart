class MovieModel {
  final int id;
  final String title;
  final String release_date;
  final String poster_path;
  final String backdrop_path;
  final double vote_average;
  final String overview;

  MovieModel(
      {required this.id,
      required this.title,
      required this.release_date,
      required this.poster_path,
      required this.backdrop_path,
      required this.vote_average,
      required this.overview});

  factory MovieModel.init(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      backdrop_path: json["backdrop_path"],
      poster_path: json["poster_path"],
      release_date: json["release_date"],
      title: json["title"],
      vote_average: json["vote_average"],
      overview: json["overview"]);
}
