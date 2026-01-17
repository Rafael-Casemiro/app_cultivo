import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart'; 
import 'package:app_cultivo/data/data.dart'; 

class PlantsNotifier extends StateNotifier<List<Plant>> {
  // Inicializa a lista com os dados estáticos (availablePlants)
  PlantsNotifier() : super(availablePlants);

  void addPlant(Plant plant) {
    // Atualiza o estado criando uma nova lista com a planta antiga + a nova
    state = [...state, plant];
  }
}

// O Provider que será usado nas telas
final plantsProvider = StateNotifierProvider<PlantsNotifier, List<Plant>>((ref) {
  return PlantsNotifier();
});