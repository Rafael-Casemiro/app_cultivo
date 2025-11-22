import 'package:flutter/material.dart';
import 'package:app_cultivo/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/screens/login_page.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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