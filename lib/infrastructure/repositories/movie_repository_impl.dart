import 'package:cinemapedia_flutter_app/domain/datasources/movies_data_source.dart';
import 'package:cinemapedia_flutter_app/domain/entities/movie.dart';
import 'package:cinemapedia_flutter_app/domain/repositories/movies_repository.dart';

class MovieRespositoryImpl extends MoviesRepository {
  final MoviesDataSource datasource;

  MovieRespositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying();
  }
}