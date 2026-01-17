import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart'; 
import 'package:app_cultivo/data/data.dart'; 

class PlantsNotifier extends StateNotifier<List<Plant>> {
  // Inicializa a lista com os dados estáticos (availablePlants)
  PlantsNotifier() : super(availablePlants) {
    _loadFirebasePlants();
  }

  final CollectionReference plantsCollection = FirebaseFirestore.instance.collection('plants');

  Future<void> _loadFirebasePlants() async {
    try {
      final snapshot = await plantsCollection.get();
      final firebasePlants = snapshot.docs.map((doc) {
        return Plant.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      state = [...availablePlants, ...firebasePlants];
    } catch (e) {
      print("Erro ao carregas plantas: $e");
    }
  }

  Future<void> addPlant(Plant plant) async {
    // Atualiza o estado criando uma nova lista com a planta antiga + a nova
    state = [...state, plant];

    try {
      await plantsCollection.doc(plant.id).set(plant.toMap());
      print("Planta salva no Firebase com sucesso!");
    } catch (e) {
      print("Erro ao salvar no Firebase: $e");
    }

  }
}

// O Provider que será usado nas telas
final plantsProvider = StateNotifierProvider<PlantsNotifier, List<Plant>>((ref) {
  return PlantsNotifier();
});