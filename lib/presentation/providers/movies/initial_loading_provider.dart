import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayingIsEmpty = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularIsEmpty = ref.watch(popularMoviesProvider).isEmpty;
  final topRatedIsEmpty = ref.watch(topRatedMoviesProvider).isEmpty;
  final upcomingIsEmpty = ref.watch(upcomingMoviesProvider).isEmpty;

  if (nowPlayingIsEmpty || popularIsEmpty || topRatedIsEmpty || upcomingIsEmpty) {
    return true;
  }
  return false;
});
