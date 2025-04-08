import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/detalhe_item_view.dart';
import 'package:flutter_application_2/view/sobre_view.dart';
import 'package:get_it/get_it.dart';
import 'package:device_preview/device_preview.dart';
import 'controller/lista_controller.dart';
import 'controller/cadastro_controller.dart';
import 'controller/login_controller.dart';
import 'view/home_view.dart';
import 'view/cadastro_view.dart';
import 'view/exibicao_view.dart';
import 'view/esqueceu_senha_view.dart';
import 'view/lista_compras_view.dart';
import 'view/adicionar_item_view.dart';
import 'view/editar_item_view.dart';

final g = GetIt.instance;

void main() {
  g.registerSingleton<CadastroController>(CadastroController());
  g.registerSingleton<LoginController>(LoginController());
g.registerSingleton<ListaController>(ListaController());

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: 'home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(builder: (_) => const HomeView());
          case 'cadastro':
            return MaterialPageRoute(builder: (_) => const CadastroView());
          case 'exibicao':
            return MaterialPageRoute(builder: (_) => const ExibicaoView());
          case 'esqueceu_senha':
            return MaterialPageRoute(builder: (_) => const EsqueceuSenhaView());
          case 'lista':
            return MaterialPageRoute(builder: (_) => const ListaComprasView());
          case 'adicionar':
            return MaterialPageRoute(builder: (_) => const AdicionarItemView());
          case 'editar':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => EditarItemView(
                index: args['index'],
                item: args['item'],
              ),
              
            );
            case 'sobre':
              return MaterialPageRoute(builder: (_) => const SobreView());
            case 'detalhes':
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(builder: (_) => DetalhesItemView(item: args));
              
          default:
            return MaterialPageRoute(
              builder: (_) => const Scaffold(
                body: Center(child: Text('Página não encontrada')),
              ),
            );
        }
      },
    );
  }
}
