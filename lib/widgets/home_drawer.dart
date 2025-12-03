import 'dart:io';
import 'package:app_cultivo/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_cultivo/data/students_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  ImageProvider getImageProvider(userProfile) {
    if (userProfile == null) {
      return const AssetImage('assets/images/Icone1.png');
    }
    return userProfile.photoPath.startsWith('assets/')
        ? AssetImage(userProfile.photoPath)
        : FileImage(File(userProfile.photoPath));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);

    return Drawer(
      width: 280,
      child: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF8aae5c)),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: getImageProvider(userProfile),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userProfile?.name ?? 'AgroPédia',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff394834),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ExpansionTile(
                    title: const Text(
                      'Componentes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff394834),
                        fontFamily: 'Roboto',
                      ),
                    ),
                    leading: const Icon(Icons.group, color: Color(0xff394834)),
                    children: availableStudent.map((student) => ListTile(
                      contentPadding: const EdgeInsets.only(
                          left: 30.0, right: 16.0),
                      leading: const Icon(Icons.person,
                          color: Color(0xff394834)),
                      title: Text(
                        student.nome,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff394834),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )).toList(),
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Sobre',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff394834),
                        fontFamily: 'Roboto',
                      ),
                    ),
                    leading:
                    const Icon(Icons.description, color: Color(0xff394834)),
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          "Essa aplicação foi resultado do trabalho avaliativo em grupo da matéria de Programação para Dispositivos Móveis.",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff394834),
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xff8aae5c),
                    ),
                    icon: const Icon(Icons.login, color: Colors.white),
                    label: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  const SizedBox(height: 8),
                  if (userProfile != null)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Colors.red,
                      ),
                      icon: const Icon(Icons.logout, color: Colors.white),
                      label: const Text(
                        'Sair',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        ref.read(userProfileProvider.notifier).clearUserProfile();
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}