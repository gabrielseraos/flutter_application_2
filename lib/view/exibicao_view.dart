import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/cadastro_controller.dart';

class ExibicaoView extends StatefulWidget {
  const ExibicaoView({super.key});

  @override
  State<ExibicaoView> createState() => _ExibicaoViewState();
}

class _ExibicaoViewState extends State<ExibicaoView> {
  final ctrl = GetIt.I.get<CadastroController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (!ctrl.logado) {
    Future.microtask(() {
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    });
    return SizedBox(); // retorna algo vazio enquanto redireciona
  }
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        actions: [
          IconButton(
            onPressed: () {
              ctrl.limparCampos();
              Navigator.pushNamedAndRemoveUntil(
                context,
                'home',
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
          
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Exibição'),
            SizedBox(height: 30),
            Text('Nome: ${ctrl.txtNome.text} '),
            Text('E-mail: ${ctrl.txtEmail.text}'),
            Text('Aceitar termos: ${ctrl.aceitarTermos}'),
          ],
        ),
      ),
    );
  }
}
