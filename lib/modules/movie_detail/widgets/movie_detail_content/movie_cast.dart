import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:app_filmes/models/casts_model.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  final CastsModel? cast;
  const MovieCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cast?.image ?? '',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            cast?.name ?? '',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            cast?.caracter ?? '',
            style: TextStyle(fontSize: 12, color: context.themeGray),
          ),
        ],
      ),
    );
  }
}
