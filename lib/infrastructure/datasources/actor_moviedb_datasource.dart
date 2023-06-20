import 'package:cinemapedia_flutter_app/config/constants/environment.dart';
import 'package:cinemapedia_flutter_app/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_flutter_app/domain/entities/actor.dart';
import 'package:cinemapedia_flutter_app/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia_flutter_app/infrastructure/models/moviesdb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDataSource {
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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors =
        castResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
}
