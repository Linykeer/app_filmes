// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_filmes/models/genre_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}
