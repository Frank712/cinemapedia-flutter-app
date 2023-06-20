import 'package:cinemapedia_flutter_app/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_flutter_app/domain/entities/actor.dart';
import 'package:cinemapedia_flutter_app/domain/repositories/actors_repositiry.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDataSource datasource;

  ActorRepositoryImpl(this.datasource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
