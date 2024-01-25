import 'package:cinemapedia/infrastructure/datasources/movie_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable (solo lectura)
final movieRepositoryProvider =
    Provider((ref) => MovieRepositoryImpl(MovieMovieDbDatasource()));
