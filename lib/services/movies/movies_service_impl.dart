// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repository/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();
}
