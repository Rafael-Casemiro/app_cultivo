import 'package:app_cultivo/models/models.dart';
import 'package:app_cultivo/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'plants_details.dart';

class Plants extends StatelessWidget {
  const Plants({
    super.key,
    required this.plants,
    required this.onToggleFavorite, 
    required this.ativarGridView,
  });

  final List<Plant> plants;
  final void Function(Plant plant) onToggleFavorite;
  final bool ativarGridView;

  void _selectPlant(BuildContext context, Plant plant) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PlantsDetailsScreen(
          plant: plant,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nada para mostrar!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tente adicionar algumas plantas para os seus favoritos.',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    if (plants.isNotEmpty) {
      if (ativarGridView == false) {
        // Carrega o ListView como padrão
        content = ListView.builder(
          itemCount: plants.length,
          itemBuilder: (ctx, index) => GestureDetector(
            onTap: () => _selectPlant(context, plants[index]),
            child: CardWidget(
              color: Theme.of(context).colorScheme.secondaryContainer,
              plant: plants[index],
              onToggleFavorite: () => onToggleFavorite(plants[index]),
            ),
          ),
        );
      } else {
        content = CardWidgetGrid(
          color: Theme.of(context).colorScheme.secondaryContainer,
          plants: plants,
          onSelectPlant: (plant) => _selectPlant(context, plant)
        );
      }
    }

    return content;
  }
}
