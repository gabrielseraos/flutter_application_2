import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controller/login_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ctrl = GetIt.I.get<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(    
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
              SizedBox(height: 20),
              Text('Bem-vindo!', style: TextStyle(fontSize: 22)),
              SizedBox(height: 30),
              TextFormField(
                controller: ctrl.txtEmail,
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o e-mail';
                  if (!value.contains('@')) return 'E-mail inválido';
                  return null;
                },
              ),
              TextFormField(
                controller: ctrl.txtSenha,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe a senha';
                  return null;
                },
              ),
              if (ctrl.erro != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    ctrl.erro!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, 'lista');
                  }
                },
                child: Text('Entrar na Lista'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'esqueceu_senha');
                },
                child: Text('Esqueceu a senha?'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'cadastro');
                },
                child: Text('Ainda não tem conta? Cadastre-se'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'sobre');
                },
                child: Text('Sobre o App'),
              ),

            ],
          ),
        ),
      ),
      
    );
  }
}
