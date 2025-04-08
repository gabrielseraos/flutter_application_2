import 'package:flutter/material.dart';
import '../model/item.dart';

class EditarItemView extends StatefulWidget {
  final int index;
  final Item item;

  const EditarItemView({super.key, required this.index, required this.item});

  @override
  State<EditarItemView> createState() => _EditarItemViewState();
}

class _EditarItemViewState extends State<EditarItemView> {
  late TextEditingController nomeCtrl;
  late TextEditingController qtdCtrl;
  late TextEditingController scoreCtrl;
  late String categoria;

  @override
  void initState() {
    super.initState();
    nomeCtrl = TextEditingController(text: widget.item.nome);
    qtdCtrl = TextEditingController(text: widget.item.quantidade.toString());
    scoreCtrl = TextEditingController(text: widget.item.score.toString());
    categoria = widget.item.categoria;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Item')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeCtrl,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: qtdCtrl,
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: scoreCtrl,
              decoration: InputDecoration(labelText: 'Score'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: categoria,
              items: ['Alimentos', 'Limpeza', 'Higiene']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => categoria = val!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final novoItem = Item(
                  nome: nomeCtrl.text,
                  quantidade: int.tryParse(qtdCtrl.text) ?? 1,
                  categoria: categoria,
                  score: int.tryParse(scoreCtrl.text) ?? 0,
                );
                Navigator.pop(context, {
                  'item': novoItem,
                  'index': widget.index,
                });
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
