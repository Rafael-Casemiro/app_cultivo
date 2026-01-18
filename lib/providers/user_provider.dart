import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  UserProfileNotifier() : super(null) {
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        state = UserProfile(
          name: data['name'],
          email: data['email'],
          photoPath: data['photoPath'],
          ativarGridView: data['ativarGridView'] ?? false,
        );
      }
    }
  }

  Future<void> loadUserProfile() async {
    await _loadUserProfile();
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': profile.name,
        'email': profile.email,
        'photoPath': profile.photoPath,
        'ativarGridView': profile.ativarGridView,
        'updatedAt': DateTime.now(),
      }, SetOptions(merge: true)); // <-- Isso evita problemas de apagamento de dados em chamadas do Firebase ||| NÃO APAGAR
      state = profile;
    }
  }

  Future<void> clearUserProfile() async {
    state = null;
  }

  // Função de atualização da tela por usuário
  // Ela permite que a tela (grid ou list) seja salva no perfil e não localmente
  Future<void> atualizarTela(bool ativarGridView) async {
    // Pega a instancia do usuário
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && state != null) {
      // Atualiza o tipo de visualização no firebase
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {'ativarGridView': ativarGridView},
      );

      // Atualiza o estado local
      state = UserProfile(
        name: state!.name,
        photoPath: state!.photoPath,
        email: state!.email,
        ativarGridView: ativarGridView,
      );
    }
  }
}

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>(
      (ref) => UserProfileNotifier(),
    );
