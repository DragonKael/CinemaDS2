import 'package:cinemagrupo7/presentation/providers/movies/movies_providers.dart';
import 'package:cinemagrupo7/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final s1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final s2 = ref.watch(MoviesSliedshowProvider).isEmpty;
  final s3 = ref.watch(popularMoviesProvider).isEmpty;
  final s4 = ref.watch(upcomingMoviesProvider).isEmpty;
  final s5 = ref.watch(topratedMoviesProvider).isEmpty;
  final s6 = ref.watch(otroMoviesProvider).isEmpty;
  final s7 = ref.watch(anotherMoviesProvider).isEmpty;
  
  if (s1 || s2 || s3 || s4 || s5 || s6 || s7)return true;

  return false;
});
