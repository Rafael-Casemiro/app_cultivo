import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cultivo/models/user_profile.dart';

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  UserProfileNotifier() : super(null) {
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name');
    final email = prefs.getString('user_email');
    final password = prefs.getString('user_password');
    final photo = prefs.getString('user_photo');
    if (name != null && email != null && photo != null && password != null) {
      state = UserProfile(name: name, email: email, photoPath: photo, password: password);
    }
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', profile.name);
    await prefs.setString('user_email', profile.email);
    await prefs.setString('user_password', profile.password);
    await prefs.setString('user_photo', profile.photoPath);
    state = profile;
  }

  Future<void> clearUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_name');
    await prefs.remove('user_email');
    await prefs.remove('user_password');
    await prefs.remove('user_photo');
    state = null;
  }
}

final userProfileProvider =
StateNotifierProvider<UserProfileNotifier, UserProfile?>(
        (ref) => UserProfileNotifier());