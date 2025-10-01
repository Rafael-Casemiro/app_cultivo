import 'package:app_cultivo/models/models.dart';
import 'package:app_cultivo/screens/plants.dart';
import 'package:flutter/material.dart';
import 'package:app_cultivo/data/data.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Plant> _favotitePlants = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toglePlantFavoriteStatus(Plant plant) {
    final isExisting = _favotitePlants.contains(plant);
    if (isExisting) {
      setState(() {
        _favotitePlants.remove(plant);
      });
      _showInfoMessage('Plant removed from favorites.');
    } else {
      setState(() {
        _favotitePlants.add(plant);
      });
      _showInfoMessage('Plant added to favorites');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = Plants(plants: _selectedPageIndex == 0 ? availablePlants : _favotitePlants, onToggleFavorite: _toglePlantFavoriteStatus);

    String activePageTitle = _selectedPageIndex == 0 ? 'Início' : 'Favoritos';

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
