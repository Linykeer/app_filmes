// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

import 'package:app_filmes/services/genres/genres_service.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final MoviesService _moviesService;
  final AuthService _authService;
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMovies = <MovieModel>[];
  var _topRatedOriginalMovies = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();
  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    messageListener(_message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);
      getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao carregar dados da pagina'),
      );
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRated();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((e) {
        if (favorites.containsKey(e.id)) {
          return e.copyWith(favorite: true);
        } else {
          return e.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((e) {
        if (favorites.containsKey(e.id)) {
          return e.copyWith(favorite: true);
        } else {
          return e.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMovies = popularMoviesData;

      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedOriginalMovies = topRatedMoviesData;
    } catch (e) {
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao carregar dados da pagina'),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMovies.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRatedMovies = _topRatedOriginalMovies.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMovies);
      topRatedMovies.assignAll(_topRatedOriginalMovies);
    }
  }

  void filterNameByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }
    genreSelected.value = genreModel;
    if (genreModel != null) {
      var newPopularMovies = _popularMovies.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });
      var newTopRatedMovies = _topRatedOriginalMovies.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMovies);
      topRatedMovies.assignAll(_topRatedOriginalMovies);
    }
  }

  Future<void> favoriteMovies(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoriteMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
