import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart';

class FavoritesPlantsNotifier extends StateNotifier<List<Plant>> {
  FavoritesPlantsNotifier() : super([]);

  void togglePlantFavoriteStatus(Plant plant) {
    final plantIsFavorite = state.contains(plant);

    if (plantIsFavorite) {
      state = state.where((p) => p.id != plant.id).toList();
    } else {
      state = [...state, plant];
    }
  }
}

final favoritePlantsProvider =
    StateNotifierProvider<FavoritesPlantsNotifier, List<Plant>>((ref) {
      return FavoritesPlantsNotifier();
    });
