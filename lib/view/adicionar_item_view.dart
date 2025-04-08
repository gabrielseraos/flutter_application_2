import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controller/lista_controller.dart';
import '../model/item.dart';

class AdicionarItemView extends StatefulWidget {
  const AdicionarItemView({super.key});

  @override
  State<AdicionarItemView> createState() => _AdicionarItemViewState();
}

class _AdicionarItemViewState extends State<AdicionarItemView> {
  final ctrl = GetIt.I<ListaController>();

  final nomeCtrl = TextEditingController();
  final qtdCtrl = TextEditingController();
  final scoreCtrl = TextEditingController();

  String categoria = 'Alimentos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Item')),
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
                ctrl.adicionar(Item(
                  nome: nomeCtrl.text,
                  quantidade: int.tryParse(qtdCtrl.text) ?? 1,
                  categoria: categoria,
                  score: int.tryParse(scoreCtrl.text) ?? 0, // Adicionando score
                ));
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
