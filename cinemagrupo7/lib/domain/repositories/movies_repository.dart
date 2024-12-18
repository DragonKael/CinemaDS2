import 'package:cinemagrupo7/domain/entities/movie.dart';



abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getOtro({int page = 1});
}