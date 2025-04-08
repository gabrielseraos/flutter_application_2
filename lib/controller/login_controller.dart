import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();

  String? erro;

  bool validarLogin() {
    if (txtEmail.text == 'teste@teste.com' && txtSenha.text == '123456') {
      erro = null;
      return true;
    } else {
      erro = 'E-mail ou senha inválidos';
      notifyListeners();
      return false;
    }
  }

  void limparCampos() {
    txtEmail.clear();
    txtSenha.clear();
    erro = null;
    notifyListeners();
  }
}
