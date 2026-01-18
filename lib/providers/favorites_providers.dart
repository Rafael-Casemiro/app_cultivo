import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_cultivo/providers/plants_provider.dart';

class FavoritesPlantsNotifier extends StateNotifier<List<Plant>> {
  final Ref ref;

  FavoritesPlantsNotifier(this.ref) : super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    // Busca os IDs do favoritos do usuário no Firebase
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists && doc.data()!.containsKey('favoritePlants')) {
      final List<dynamic> favoriteIds = doc.data()!['favoritePlants'];

      // Seleciona as plantas
      final allPlants = ref.read(plantsProvider);

      // Guarda as plantas que têm o ID salvo na lista de favoritos
      state = allPlants
          .where((plant) => favoriteIds.contains(plant.id))
          .toList();
    }
  }

  Future<void> _updateFirebase(List<Plant> newFavorites) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final plantIds = newFavorites.map((plant) => plant.id).toList();

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'favoritePlants': plantIds,
    }, SetOptions(merge: true));
  }

  void togglePlantFavoriteStatus(Plant plant) {
    // Compara IDs e verifica se já é favorito
    final isFavorite = state.any((p) => p.id == plant.id);

    if (isFavorite) {
      state = state.where((p) => p.id != plant.id).toList();
    } else {
      state = [...state, plant];
    }

    // Atualiza no Firebase
    _updateFirebase(state);
  }
}

final favoritePlantsProvider =
    StateNotifierProvider<FavoritesPlantsNotifier, List<Plant>>((ref) {
      // Recria a lista de favoritos, co adicionar novas plantas
      ref.watch(plantsProvider);

      return FavoritesPlantsNotifier(ref);
    });
