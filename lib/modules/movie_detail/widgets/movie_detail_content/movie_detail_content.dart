import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_content.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_detail_content_companies.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_detail_content_main_cast.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_detail_title.dart';
import 'package:flutter/material.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailTitle(movie: movie),
        MovieContent(movie: movie),
        MovieDetailContentCompanies(movie: movie),
        MovieDetailContentMainCast(movie: movie)
      ],
    );
  }
}
