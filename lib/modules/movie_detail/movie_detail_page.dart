import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_detail_content.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_detail_content_companies.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Column(
              children: [
                MovieDetailHeader(movie: controller.movie.value),
                MovieDetailContent(movie: controller.movie.value),
              ],
            ),
          );
        },
      ),
    );
  }
}
