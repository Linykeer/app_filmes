import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/movies/movies_bindings.dart';
import 'home_controller.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.movie,
                  ),
                  label: 'Filmes'),
              BottomNavigationBarItem(
                icon: Icon(
                  FilmesAppIcons.heart_empty,
                ),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.logout_outlined,
                  ),
                  label: 'Sair')
            ],
            onTap: controller.goToPage,
            currentIndex: controller.pageIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: context.themeRed,
          );
        },
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.navigatorKey),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindings(),
            );
          } else if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }
          return null;
        },
      ),
    );
  }
}
