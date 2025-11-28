import 'package:flutter/material.dart';
import 'package:app_cultivo/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/screens/login_page.dart';

void main() {
  runApp(
    // Envolve o aplicativo com ProviderScope para habilitar o Riverpod
    const ProviderScope(child: MyApp())
  );
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
        '/login': (context) => const LoginPage(),
      },
      initialRoute: '/',
    );
  }
}