// Arquivo para gerenciar o estado das plantas favoritas usando Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart';

/// Classe que gerencia o estado da lista de favoritos.
/// Estende StateNotifier, onde o estado é uma Lista de objetos Plant (`List<Plant>`).
class FavoritesPlantsNotifier extends StateNotifier<List<Plant>> {
  // Construtor que inicializa o estado com uma lista vazia
  FavoritesPlantsNotifier() : super([]);

  // Método para alternar o status de favorito de uma planta
  void togglePlantFavoriteStatus(Plant plant) {

    // Verifica se a planta já está na lista de favoritos
    final plantIsFavorite = state.contains(plant);

    // Se estiver na lista de favoritos a planta é removida, caso contrário é adicionada
    if (plantIsFavorite) {
      // Cria uma nova lista filtrando todas as plantas, EXCETO a que tem o ID igual ao da planta atual.
      state = state.where((p) => p.id != plant.id).toList();
    } else {
       // Cria uma nova lista contendo todos os itens antigos (...state) + a nova planta.
      state = [...state, plant];
    }
  }
}

/// Provider que expõe o estado gerenciado por FavoritesPlantsNotifier.
final favoritePlantsProvider =
    StateNotifierProvider<FavoritesPlantsNotifier, List<Plant>>((ref) {
      return FavoritesPlantsNotifier();
    });
