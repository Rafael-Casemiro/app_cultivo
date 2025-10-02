import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart';

class PlantsDetailsScreen extends ConsumerWidget {
  const PlantsDetailsScreen({
    super.key,
    required this.plant,
    required this.onToggleFavorite,
  });

  final Plant plant;
  final void Function(Plant plant) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesPlants = ref.watch(favoritePlantsProvider);
    final isFavorite = favoritesPlants.contains(plant);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(plant.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.star,
              color: isFavorite ? Colors.yellow : Colors.black,
            ),
            onPressed: () {
              onToggleFavorite(plant);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            plant.imagePath!,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descrição:',
                  style: KTextStyles.textDetails,
                ),
                Text(
                  plant.description,
                  style: KTextStyles.subTextDetails,
                ),
                const SizedBox(height: 18),
                Text(
                  'Instruções:',
                  style: KTextStyles.textDetails
                ),
                Text(
                  plant.instructions,
                  style: KTextStyles.subTextDetails,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
