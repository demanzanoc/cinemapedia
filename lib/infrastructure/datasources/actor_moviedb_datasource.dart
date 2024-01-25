import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/datasources/base_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

import '../../domain/datasources/actors_datasource.dart';

class ActorMovieDbDatasource extends BaseMovieDbDatasource
    implements ActorsDatasource {
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    if (response.statusCode != 200) {
      throw Exception('Credits to the movie with id: $movieId not found');
    }
    final credits = CreditsResponse.fromJson(response.data);
    final List<Actor> actors =
        credits.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();
    return actors;
  }
}
