import 'package:flutter/material.dart';

class DetalhesItemView extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetalhesItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Item')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${item['nome']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Quantidade: ${item['quantidade']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Score: ${item['score']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
