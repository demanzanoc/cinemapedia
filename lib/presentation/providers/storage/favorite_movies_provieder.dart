import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favorteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StorageMoviesNotifier(
      localStorageRepository: localStorageRepository,
    );
  },
);

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  StorageMoviesNotifier({
    required this.localStorageRepository,
  }) : super({});

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10);
    page++;

    final Map<int, Movie> tempMoviesMap = {};

    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};
    
    return movies;
  }
}
