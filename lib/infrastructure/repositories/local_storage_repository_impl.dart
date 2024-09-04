import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource _datasource;

  LocalStorageRepositoryImpl(this._datasource);

  @override
  Future<bool> isMovieFavorite(int movieId) =>
      _datasource.isMovieFavorite(movieId);

  @override
  Future<List<Movie>> loadMovies({int limit = 16, offset = 0}) =>
      _datasource.loadMovies(limit: limit, offset: offset);

  @override
  Future<void> toggleFavorite(Movie movie) => _datasource.toggleFavorite(movie);
}
