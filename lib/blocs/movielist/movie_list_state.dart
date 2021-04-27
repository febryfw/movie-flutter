import 'package:equatable/equatable.dart';
import 'package:flutter_movie/model/movie_list_response.dart';
import 'package:flutter_movie/model/movie_model.dart';

abstract class MovieListState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieListUninitialized extends MovieListState {}

class MovieListFetched extends MovieListState {
  final List<Movie> movieList;
  final bool hasReachedMax;
  final int page;

  MovieListFetched({this.movieList, this.hasReachedMax, this.page});

  MovieListFetched copyWith({
    List<Movie> movieList,
    bool hasReachedMax,
    int page,
  }) {
    return MovieListFetched(
      movieList: movieList ?? this.movieList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page
    );
  }

  @override
  List<Object> get props => [movieList, hasReachedMax];
}

class MovieListFailed extends MovieListState {}
