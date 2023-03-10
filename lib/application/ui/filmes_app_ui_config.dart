import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._();
  static String get title => 'Filmes App';
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.metrophobic().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Color(0xff222222),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      );
}
