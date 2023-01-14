// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:app_filmes/services/login/login_service.dart';

class HomeController extends GetxController {
  static const navigatorKey = 1;
  static const indexPageExit = 2;
  final LoginService _loginService;

  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  final _pages = [
    '/movies',
    '/favorites',
  ];

  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == indexPageExit) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: navigatorKey);
    }
  }
}
