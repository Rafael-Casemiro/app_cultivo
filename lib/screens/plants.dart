import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/widgets/card_widget.dart';
import 'package:app_cultivo/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class Plants extends StatelessWidget {
  const Plants({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        title: Text(KTexts.tituloApp),
      ),
      body: ListView(
        children: [
          for (final plant in availablePlants)
            CardWidget(color: Theme.of(context).colorScheme.secondaryContainer, plant: plant),
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}