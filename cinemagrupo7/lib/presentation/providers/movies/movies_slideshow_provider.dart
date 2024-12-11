import 'package:cinemagrupo7/domain/entities/movie.dart';
import 'package:cinemagrupo7/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final MoviesSliedshowProvider = Provider<List<Movie>>((ref) {
  final nowplayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowplayingMovies.isEmpty) return [];
  return nowplayingMovies.sublist(0, 6);
});
