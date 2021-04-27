import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {}

class FetchMovieList extends MovieListEvent {

  @override
  List<Object> get props => [];
}