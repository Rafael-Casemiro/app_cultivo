import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Seus imports
import 'package:app_cultivo/screens/tabs.dart';
import 'package:app_cultivo/screens/login.dart';
import 'package:app_cultivo/screens/cadastro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ); 
    }
  } catch (e) {
    debugPrint("Firebase já inicializado ou erro ignorável: $e");
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffb3d38d)),
        scaffoldBackgroundColor: const Color(0xffb3d38d),
      ),
      routes: {
        '/': (context) => const TabsScreen(),
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const CadastroPage(),
      },
      initialRoute: '/',
    );
  }
}