import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/providers/user_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        backgroundColor: const Color(0xFF8aae5c),
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Preferências de Exibição",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SwitchListTile(
                  title: const Text("Visualização em Grade"),
                  subtitle: const Text("Exibir plantas como grade"),
                  value: user.ativarGridView,
                  activeThumbColor: const Color(0xFF8aae5c),
                  onChanged: (bool value) {
                    // Chama o provider para atualizar no Firebase
                    ref.read(userProfileProvider.notifier).atualizarTela(value);
                  },
                ),
              ],
            ),
    );
  }
}