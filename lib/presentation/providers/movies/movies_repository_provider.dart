import 'package:cinemapedia_flutter_app/infrastructure/datasources/the_moviedb_datasource.dart';
import 'package:cinemapedia_flutter_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRespositoryImpl(MovieDBDataSource());
});
