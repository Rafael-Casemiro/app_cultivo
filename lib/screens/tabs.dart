import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/screens/plants.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
import 'package:app_cultivo/providers/display_mode_provider.dart';
import 'package:app_cultivo/widgets/home_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritePlants = ref.watch(favoritePlantsProvider);
    final ativarGridView = ref.watch(displayModeProvider);

    Widget activePage = Plants(
      plants: _selectedPageIndex == 0 ? availablePlants : favoritePlants, 
      onToggleFavorite: (plant) {
        ref.read(favoritePlantsProvider.notifier).togglePlantFavoriteStatus(plant);
        final becameFavorite = ref.read(favoritePlantsProvider).contains(plant);
        _showInfoMessage(becameFavorite? "Planta Adicionada" : "Planta Removida");
      },
      ativarGridView: ativarGridView,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Plantas"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        // Botão de alternância de modo de visualização
        actions: [
          IconButton(
            icon: Icon(ativarGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              ref.read(displayModeProvider.notifier).toggleDisplayMode();
            }
          )
        ],
      ),
      drawer: const HomeDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
