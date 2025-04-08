import 'package:flutter/material.dart';
import '../model/item.dart';

class ListaController extends ChangeNotifier {
  final List<Item> _itens = [];

  List<Item> get itens => _itens;

  void adicionar(Item item) {
    _itens.add(item);
    notifyListeners();
  }

  void remover(Item item) {
    _itens.remove(item);
    notifyListeners();
  }

  void editar(int index, Item novoItem) {
    _itens[index] = novoItem;
    notifyListeners();
  }

  void limparLista() {
    _itens.clear();
    notifyListeners();
  }
  void atualizarItem(int index, Item novoItem) {
  itens[index] = novoItem;
  notifyListeners();
  }
  void ordenarPorNome() {
    _itens.sort((a, b) => a.nome.compareTo(b.nome));
    notifyListeners();
  }

  void ordenarPorScore() {
    _itens.sort((a, b) => b.score.compareTo(a.score));
    notifyListeners();
  }
  void removerPorIndex(int index) {
    _itens.removeAt(index);
    notifyListeners();
  }

}
