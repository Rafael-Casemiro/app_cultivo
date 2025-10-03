import 'package:app_cultivo/screens/tabs.dart';
<<<<<<< Updated upstream
import 'package:flutter/material.dart';
=======
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MyApp());
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
      home: TabsScreen(),
    );
  }
}