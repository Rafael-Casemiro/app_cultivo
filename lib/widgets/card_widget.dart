import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/models/models.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.color,
    required this.plant,
  });

  final Color color;
  final Plant plant;

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
                child: Image.network(
                  plant.imageUrl!,
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
        )
      ),
    );
  }
}