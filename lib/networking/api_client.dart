import 'package:flutter_movie/model/movie_list_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../constant/movie_db_api_key.dart' as movieDbConstant;

class ApiClient {
  static const String _baseUrl = "http://api.themoviedb.org/3";
  final apiKey = movieDbConstant.API_KEY;
  final http.Client httpClient;

  ApiClient({this.httpClient}) : assert(httpClient != null);

  Future<MovieListResponse> getMovieList(int page) async {
    final movieListUrl = "$_baseUrl/movie/popular?api_key=$apiKey&page=$page";
    final movieResponse = await this.httpClient.get(Uri.parse(movieListUrl));
    if(movieResponse.statusCode != 200) {
      throw Exception("error getting movie list");
    }

    final movieListJson = jsonDecode(movieResponse.body);
    return MovieListResponse.fromJson(movieListJson);
  }
}