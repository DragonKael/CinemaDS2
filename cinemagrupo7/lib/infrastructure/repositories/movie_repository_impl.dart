import 'package:cinemagrupo7/domain/datasources/movies_datasource.dart';
import 'package:cinemagrupo7/domain/entities/movie.dart';
import 'package:cinemagrupo7/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }


}