import 'package:app_cultivo/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("teste"),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}