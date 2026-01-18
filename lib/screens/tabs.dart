// Tela de abas principais do aplicativo
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/screens/plants.dart';
import 'package:app_cultivo/screens/plants_register.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
import 'package:app_cultivo/providers/plants_provider.dart';
import 'package:app_cultivo/widgets/home_drawer.dart';
import 'package:app_cultivo/providers/user_provider.dart';

// É utilizado ConsumerStatefulWidget para ter acesso ao 'ref' (Riverpod)
// e também manter o estado local da aba selecionada (Stateful).
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // Controla a aba selecionada no BottomNavigationBar
  // 0 = Tela Inicial, 1 = Tela de Favoritos.
  int _selectedPageIndex = 0;

  // Função para exibir uma mensagem temporária (SnackBar) na tela
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Função para alterar a aba selecionada
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Função para abrir a tela de cadastro
  void _openCadastroScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const CadastroScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ref.watch: "Escuta" os providers. Se a lista de favoritos ou o modo de visualização mudar,
    // o método build é executado novamente para atualizar a tela.
    final favoritePlants = ref.watch(favoritePlantsProvider);
    final allPlants = ref.watch(plantsProvider);
    final userProfile = ref.watch(userProfileProvider);
    final ativarGridView = userProfile?.ativarGridView ?? false;

    // Define qual página será exibida com base na aba selecionada
    Widget activePage = Plants(
      // Lista de plantas a serem exibidas depende da aba selecionada
      plants: _selectedPageIndex == 0 ? allPlants : favoritePlants,
      onToggleFavorite: (plant) {
        // ref.read: Usado para executar uma ação sem ficar "ouvindo" mudanças.
        ref.read(favoritePlantsProvider.notifier).togglePlantFavoriteStatus(plant);
        // Verifica se a planta ainda está na lista para decidir a mensagem
        final becameFavorite = ref.read(favoritePlantsProvider).contains(plant);
        _showInfoMessage(becameFavorite ? "Planta Adicionada" : "Planta Removida");
      },
      ativarGridView: ativarGridView,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Plantas"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      drawer: const HomeDrawer(),
      body: activePage,
      
      floatingActionButton: _selectedPageIndex == 0 
          ? FloatingActionButton(
              onPressed: _openCadastroScreen,
              child: const Icon(Icons.add),
            )
          : null,

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