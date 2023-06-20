import 'package:cinemapedia_flutter_app/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movideId);
}
