import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../networking/api_client.dart';
import '../screen/detail_page.dart';
import '../screen/home_page.dart';
import '../blocs/movielist/movie_list_bloc.dart';
import '../repository/movie_repository.dart';

const String homeRoute = "/";
const String detailRoute = "/detail";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      MovieRepository movieRepository = MovieRepository(apiClient: ApiClient(httpClient: http.Client()));

      return MaterialPageRoute(builder: (ctx) {
        return BlocProvider(
          create: (ctx) => MovieListBloc(movieRepository: movieRepository),
          child: HomePage(),
        );
      });
    case detailRoute:
      final movieModel = settings.arguments;
      return MaterialPageRoute(builder: (_) => DetailPage(movieModel));
    default:
      return null;
  }
}
