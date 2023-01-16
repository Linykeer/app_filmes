// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:get/get.dart';

import 'package:app_filmes/services/genres/genres_service.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  MoviesController({
    required GenresService genresService,
  }) : _genresService = genresService;

  @override
  void onInit() {
    messageListener(_message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);
    } catch (e) {
      _message(
        MessageModel.error(title: 'Erro', message: 'Erro ao buscar Genres'),
      );
    }
  }
}
