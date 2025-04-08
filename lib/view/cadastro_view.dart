import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/cadastro_controller.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final ctrl = GetIt.I.get<CadastroController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Cadastro'),
              SizedBox(height: 30),
              TextFormField(
                controller: ctrl.txtNome,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o nome';
                  return null;
                },
              ),
              TextFormField(
                controller: ctrl.txtEmail,
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o e-mail';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ctrl.txtTelefone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o telefone';
                  if (value.length < 10) return 'Telefone inválido';
                  return null;
                },
              ),
              SwitchListTile(
                title: Text('Aceitar os termos'),
                value: ctrl.aceitarTermos,
                onChanged: (valor) => ctrl.atualizarTermos(valor),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  if (!ctrl.aceitarTermos) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Erro'),
                        content: Text('Você precisa aceitar os termos.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  ctrl.realizarLogin();
                  Navigator.pushNamed(context, 'exibicao');
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
