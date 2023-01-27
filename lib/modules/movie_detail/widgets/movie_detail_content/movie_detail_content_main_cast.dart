import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_detail_content/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = false.obs;
  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGray,
        ),
        Obx(() {
          return ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            children: [
              ExpansionPanel(
                canTapOnHeader: false,
                isExpanded: showPanel.value,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie?.cast
                            .map((e) => MovieCast(
                                  cast: e,
                                ))
                            .toList() ??
                        [],
                  ),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
