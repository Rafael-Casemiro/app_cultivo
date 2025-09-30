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
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plant.name, 
              style: TextStyle(
                backgroundColor: Colors.greenAccent, 
              ),
            ),
            Image.network(
              plant.imageUrl!,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        )
      ),
    );
  }
}