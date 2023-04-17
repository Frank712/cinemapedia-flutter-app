import 'package:cinemapedia_flutter_app/config/constants/environment.dart';
import 'package:cinemapedia_flutter_app/domain/datasources/movies_data_source.dart';
import 'package:cinemapedia_flutter_app/domain/entities/movie.dart';
import 'package:cinemapedia_flutter_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_flutter_app/infrastructure/models/moviesdb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();
    return movies;
  }
}
