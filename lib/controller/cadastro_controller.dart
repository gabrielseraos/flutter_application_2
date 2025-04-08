import 'package:flutter/material.dart';

class CadastroController extends ChangeNotifier{

  var txtNome= TextEditingController();
  var txtEmail= TextEditingController();
  TextEditingController txtTelefone = TextEditingController();
  bool _aceitarTermos = false;
  bool get aceitarTermos => _aceitarTermos;
  bool _logado = false;
  bool get logado => _logado;



  void atualizarTermos(valor){
    _aceitarTermos = valor;
    notifyListeners();
  }

  void limparCampos() {
    txtNome.clear();
    txtEmail.clear();
    _aceitarTermos = false;
    notifyListeners();
  }

  void realizarLogin() {
  _logado = true;
  notifyListeners();
}

void realizarLogout() {
  _logado = false;
  limparCampos();
  notifyListeners();
}
}