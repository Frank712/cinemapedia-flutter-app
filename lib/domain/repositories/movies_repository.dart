import 'package:cinemapedia_flutter_app/domain/entities/movie.dart';

abstract class MoviesRepository {
  
  Future<List<Movie>>getNowPlaying({int page = 1});

}