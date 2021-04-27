
import '../model/movie_list_response.dart';
import '../networking/api_client.dart';

class MovieRepository {
  final ApiClient apiClient;

  MovieRepository({this.apiClient}) : assert(apiClient != null);

  Future<MovieListResponse> getMovieList(int page) async {
    return apiClient.getMovieList(page);
  }
}