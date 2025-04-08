class Item {
  String nome;
  int quantidade;
  String categoria;
  int score; // <--- este campo precisa existir
  Item({
    required this.nome,
    required this.quantidade, 
    required this.categoria,
    required this.score
    });
}