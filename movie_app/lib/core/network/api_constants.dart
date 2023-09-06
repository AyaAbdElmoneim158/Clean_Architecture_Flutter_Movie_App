class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static const String apiKey = "d5c35e51c81488b19da7c1f572507a3d";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int idMovie) =>
      "$baseUrl/movie/$idMovie?api_key=$apiKey";
  static String recommendPath(int idMovie) =>
      "$baseUrl/movie/$idMovie/recommendations?api_key=$apiKey"; //:> 976573

  static String imageUrl(String backdropPath) => "$baseImageUrl$backdropPath";
}
