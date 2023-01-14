import 'dart:developer';

import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final LoginService _loginService;

  final message = Rxn<MessageModel>();
  final loading = false.obs;

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading.value = true;
      await _loginService.login();
      loading.value = false;
      message(
        MessageModel.info(
            title: 'Sucesso', message: 'Login realizado com sucesso!'),
      );
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      loading.value = false;
      MessageModel.error(title: 'Erro', message: 'Erro ao realizar login');
    }
  }
}
