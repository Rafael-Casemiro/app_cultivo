import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/screens/plants.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
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

    Widget activePage = Plants(
      plants: _selectedPageIndex == 0 ? availablePlants : favoritePlants, 
      onToggleFavorite: (plant) {
        ref.read(favoritePlantsProvider.notifier).togglePlantFavoriteStatus(plant);
        final becameFavorite = ref.read(favoritePlantsProvider).contains(plant);
        _showInfoMessage(becameFavorite? "Planta Adicionada" : "Planta Removida");
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Plants"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
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
