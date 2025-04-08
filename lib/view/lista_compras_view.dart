import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/item.dart';
import 'package:get_it/get_it.dart';
import '../controller/lista_controller.dart';
import 'editar_item_view.dart';

class ListaComprasView extends StatelessWidget {
  const ListaComprasView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = GetIt.I<ListaController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              ctrl.ordenarPorNome();
            },
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              ctrl.ordenarPorScore();              
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Limpar tudo?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        ctrl.limparLista();
                        Navigator.pop(context);
                      },
                      child: Text('Confirmar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: ctrl,
        builder: (context, _) => ListView.builder(
          itemCount: ctrl.itens.length,
          itemBuilder: (context, index) {
            final item = ctrl.itens[index];
            return ListTile(
              title: Text('${item.nome} (${item.quantidade})'),
              subtitle: Text(item.categoria),
              onTap: () {
                Navigator.pushNamed(context, 'detalhes', arguments: {
                  'nome': item.nome,
                  'quantidade': item.quantidade,
                  'score': item.score,
                });
              },
              onLongPress: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditarItemView(index: index, item: item),
                  ),
                );
                if (resultado != null && resultado is Map<String, dynamic>) {
                  final novoItem = resultado['item'] as Item;
                  final indexEditado = resultado['index'] as int;
                  ctrl.atualizarItem(indexEditado, novoItem);
                }
              },
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Remover Item'),
                      content: Text('Tem certeza que deseja remover este item?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            ctrl.removerPorIndex(index); 
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Item removido com sucesso!')),
                            );
                          },
                          child: Text('Remover', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'adicionar'),
      ),
    );
  }
}
