import 'dart:io';
import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/models/models.dart';
import 'package:flutter/material.dart';

Widget _buildImage(String? path, {double? height, double? width, BoxFit? fit}) {
  if (path == null || path.isEmpty) {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300],
      child: const Icon(Icons.image_not_supported, color: Colors.grey),
    );
  }

  if (path.startsWith('assets') || path.startsWith('lib')) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }

  return Image.file(
    File(path),
    height: height,
    width: width,
    fit: fit ?? BoxFit.cover,
    errorBuilder: (ctx, _, __) => Container(
      height: height,
      width: width,
      color: Colors.grey,
      child: const Icon(Icons.broken_image),
    ),
  );
}


class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.color,
    required this.plant,
    required this.onToggleFavorite,
  });

  final Color color;
  final Plant plant;
  final void Function() onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: _buildImage( 
                  plant.imagePath,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name,
                      style: KTextStyles.tituloCard,
                    ),
                    Text(
                      plant.sciname,
                      maxLines: 2,
                      style: KTextStyles.sciDesc,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidgetGrid extends StatelessWidget {
  const CardWidgetGrid({
    super.key,
    required this.color,
    required this.plants,
    required this.onSelectPlant,
  });

  final Color color;
  final List<Plant> plants;
  final void Function(Plant plant) onSelectPlant;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: plants.length,
      itemBuilder: (ctx, index) {
        final plant = plants[index];
        return GestureDetector(
          onTap: () => onSelectPlant(plant),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _buildImage(
                    plant.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        plant.name,
                        style: KTextStyles.tituloCard,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        plant.sciname,
                        style: KTextStyles.sciDesc,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}