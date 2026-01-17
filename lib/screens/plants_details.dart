import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
import 'package:app_cultivo/data/data.dart';

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
    double widthScreen = MediaQuery.of(context).size.width;
    final favoritesPlants = ref.watch(favoritePlantsProvider);
    final isFavorite = favoritesPlants.contains(plant);

    Widget imageWidget;
    
    if (plant.imagePath == null || plant.imagePath!.isEmpty) {
      imageWidget = Container(
        color: Colors.grey[200],
        child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
      );
    } 
    else if (plant.imagePath!.contains('assets') || plant.imagePath!.contains('lib')) {
      imageWidget = Image.asset(
        plant.imagePath!,
        fit: BoxFit.cover,
      );
    } 
    else {
      imageWidget = Image.file(
        File(plant.imagePath!),
        fit: BoxFit.cover,
        errorBuilder: (ctx, error, stackTrace) {
          return Container(
             color: Colors.grey[200],
             child: const Center(child: Icon(Icons.broken_image, color: Colors.red)),
          );
        },
      );
    }


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(plant.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              onToggleFavorite(plant);
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return FractionallySizedBox(
            widthFactor: widthScreen > 500 ? 0.5 : 1.0,
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SizedBox(
                          height: 170,
                          width: 170,
                          child: imageWidget, // Usa o widget seguro criado acima
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
                    ),
                  ],
                ),
                const Divider(thickness: 6.5, color: Color(0xffb3d38d)),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Descrição:', style: KTextStyles.textDetails),
                      Text(plant.description, style: KTextStyles.subTextDetails),
                      const SizedBox(height: 18),
                      Text('Instruções:', style: KTextStyles.textDetails),
                      Text(plant.instructions, style: KTextStyles.subTextDetails),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}