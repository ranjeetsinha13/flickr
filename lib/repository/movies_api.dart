import 'dart:convert';

import 'package:flickr/app_secret.dart';
import 'package:flickr/models/movie_model.dart';
import 'package:http/http.dart';

class MoviesApi {
  static const _baseUrl = "https://api.themoviedb.org/3/movie";
  Client client = Client();
  static const _apiKey = TMDB_API_KEY;

  static const _listType = ['popular', 'top_rated', 'upcoming'];

  Future<MovieModel> fetchMovieList(String type) async {
    Response response;
    if (_apiKey == TMDB_API_KEY && _listType.contains(type)) {
      response = await client.get("$_baseUrl/$type?api_key=$_apiKey");
    } else {
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data' + response.toString());
    }
  }
}

final moviesApi = MoviesApi();
