import 'package:app_cultivo/data/data.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(plant.name),
        centerTitle: true,
        actions: [
          IconButton(
<<<<<<< Updated upstream
            icon: Icon(Icons.star),
=======
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border
            ),
>>>>>>> Stashed changes
            onPressed: () {
              onToggleFavorite(plant);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    plant.imagePath!,
                    height: 170,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plant.name, style: KTextStyles.nomeDetails),
                    Text(plant.sciname, style: KTextStyles.sciDetails),
                    Text(plant.season, style: KTextStyles.seasonDetails),
                  ],
                ),
              )
            ],
          ),
          Divider(thickness: 6.5, color: Color(0xffb3d38d),),
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
