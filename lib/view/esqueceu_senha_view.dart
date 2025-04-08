import 'package:flutter/material.dart';

class EsqueceuSenhaView extends StatefulWidget {
  const EsqueceuSenhaView({super.key});

  @override
  State<EsqueceuSenhaView> createState() => _EsqueceuSenhaViewState();
}

class _EsqueceuSenhaViewState extends State<EsqueceuSenhaView> {
  final txtEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recuperar Senha')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Informe seu e-mail para receber instruções de recuperação.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o e-mail';
                  if (!value.contains('@')) return 'E-mail inválido';
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aqui você pode chamar um método de envio
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Sucesso'),
                        content: Text('Instruções enviadas para ${txtEmail.text}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Enviar instruções'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar para login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
