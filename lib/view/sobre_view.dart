import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Objetivo do App:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text('Este aplicativo tem como objetivo facilitar o controle de compras do usuário, permitindo adicionar, editar e visualizar itens em uma lista.'),
            SizedBox(height: 20),
            Text('Integrantes:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text('• Gabriel Soares\n• Lucas de Oliveira'),
          ],
        ),
      ),
    );
  }
}
