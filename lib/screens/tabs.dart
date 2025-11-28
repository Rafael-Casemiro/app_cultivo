// Tela de abas principais do aplicativo
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/screens/plants.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
import 'package:app_cultivo/providers/display_mode_provider.dart';
import 'package:app_cultivo/widgets/home_drawer.dart';


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
    ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text(message)));
  }

  // Função para alterar a aba selecionada
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ref.watch: "Escuta" os providers. Se a lista de favoritos ou o modo de visualização mudar,
    // o método build é executado novamente para atualizar a tela.
    final favoritePlants = ref.watch(favoritePlantsProvider);
    final ativarGridView = ref.watch(displayModeProvider);

    // Define qual página será exibida com base na aba selecionada
    Widget activePage = Plants(
      // Lista de plantas a serem exibidas depende da aba selecionada
      plants: _selectedPageIndex == 0 ? availablePlants : favoritePlants,

      onToggleFavorite: (plant) {
        // ref.read: Usado para executar uma ação sem ficar "ouvindo" mudanças.
        ref.read(favoritePlantsProvider.notifier).togglePlantFavoriteStatus(plant);

        // Verifica se a planta ainda está na lista para decidir a mensagem
        final becameFavorite = ref.read(favoritePlantsProvider).contains(plant);
        _showInfoMessage(becameFavorite? "Planta Adicionada" : "Planta Removida");
      },
      ativarGridView: ativarGridView, // Passa a preferência de grade/lista para a tela filha
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Plantas"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        // Botão de alternância de modo de visualização
        actions: [
          IconButton(
            // Muda o ícone baseado no modo atual
            icon: Icon(ativarGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              // Chama o notifier para inverter o valor booleano do modo de exibição
              ref.read(displayModeProvider.notifier).toggleDisplayMode();
            }
          )
        ],
      ),
      
      drawer: const HomeDrawer(), // Adiciona o menu lateral (Hambúrger)
      body: activePage, // O corpo da tela é o widget 'activePage' configurado acima
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage, // Chama a função para alterar a aba ao tocar
        currentIndex: _selectedPageIndex, // Destaca o ícone da aba selecionada
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
