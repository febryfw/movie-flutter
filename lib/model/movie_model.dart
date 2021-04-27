import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String language, title, overview, posterUrl, backdropUrl, releaseDate;
  final double voteResult;
  final int voteParticipant;

  MovieModel(this.id, this.language, this.title, this.overview, this.posterUrl,
      this.backdropUrl, this.releaseDate, this.voteResult, this.voteParticipant);

  @override
  List<Object> get props => [id, language, title, overview, posterUrl,
    releaseDate, voteResult, voteParticipant];
}