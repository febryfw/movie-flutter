import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/model/movie_list_response.dart';

import 'movie_list_event.dart';
import 'movie_list_state.dart';
import '../../repository/movie_repository.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> implements Equatable{
  final MovieRepository movieRepository;

  MovieListBloc({@required this.movieRepository})
      : assert(movieRepository != null),
        super(MovieListUninitialized());

  @override
  Stream<MovieListState> mapEventToState(MovieListEvent event) async* {
    if (event is FetchMovieList && !_hasReachedMax(state)) {
      try {
        if (state is MovieListUninitialized) {
          final MovieListResponse response =
              await movieRepository.getMovieList(1);
          yield MovieListFetched(
            movieList: response.results,
            page: response.page,
            hasReachedMax: false,
          );
        } else if (state is MovieListFetched) {
          MovieListFetched fetchedState = state;
          final MovieListResponse response =
              await movieRepository.getMovieList(fetchedState.page + 1);
          yield response.page == response.totalPages
              ? fetchedState.copyWith(hasReachedMax: true)
              : MovieListFetched(
                  movieList: fetchedState.movieList + response.results,
                  hasReachedMax: false,
                  page: response.page,
                );
        } else if (state is MovieListFailed) {
          final MovieListResponse response =
              await movieRepository.getMovieList(1);
          yield MovieListFetched(
            movieList: response.results,
            page: response.page,
            hasReachedMax: false,
          );
        }
      } catch (_) {
        yield MovieListFailed();
      }
    }
  }

  bool _hasReachedMax(MovieListState state) =>
      state is MovieListFetched && state.hasReachedMax;

  @override
  List<Object> get props => [movieRepository];

  @override
  bool get stringify => true;
}
