import 'package:flutter/material.dart';
import 'package:app_cultivo/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/screens/cadastro.dart';
import 'package:app_cultivo/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

// o widget raiz do aplicativo
// Define configurações globais como tema e tela inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      // Configuração do tema do aplicativo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffb3d38d)),
        scaffoldBackgroundColor: Color(0xffb3d38d),
      ),
      routes: {
        '/': (context) => const TabsScreen(),
        '/cadastro': (context) => const CadastroPage(),
        '/login': (context) => const LoginPage(),
      },
      initialRoute: '/',
    );
  }
}