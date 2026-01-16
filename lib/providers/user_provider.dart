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
        'updatedAt': DateTime.now(),
      });
      state = profile;
    }
  }

  Future<void> clearUserProfile() async {
    state = null;
  }
}

final userProfileProvider =
StateNotifierProvider<UserProfileNotifier, UserProfile?>(
        (ref) => UserProfileNotifier());