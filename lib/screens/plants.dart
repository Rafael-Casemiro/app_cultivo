// Tela que exibe a lista de plantas
import 'package:app_cultivo/models/models.dart';
import 'package:app_cultivo/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'plants_details.dart';

// Classe que representa a tela de lista de plantas
class Plants extends StatelessWidget {
  const Plants({
    super.key,
    required this.plants, // Lista de plantas a serem exibidas
    required this.onToggleFavorite, // Função para alternar o status de favorito
    required this.ativarGridView, // Define se a exibição será em GridView ou ListView
  });

  final List<Plant> plants;
  final void Function(Plant plant) onToggleFavorite;
  final bool ativarGridView;

  // Função para navegar para a tela de detalhes da planta selecionada
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
    // Widget padrão para quando não há plantas na lista
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Centraliza o conteúdo verticalmente
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

    // Verifica se há plantas na lista para exibir
    if (plants.isNotEmpty) {
      // Verifica o modo de exibição (GridView ou ListView) escolhida pelo usuário
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
        // Carrega em formato gridview
        content = CardWidgetGrid(
          color: Theme.of(context).colorScheme.secondaryContainer,
          plants: plants,
          onSelectPlant: (plant) => _selectPlant(context, plant),
        );
      }
    }

    return content;
  }
}
