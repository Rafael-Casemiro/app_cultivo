import 'package:app_cultivo/screens/favorites.dart';
import 'package:app_cultivo/screens/plants.dart';
import 'package:flutter/material.dart';

int paginaSelecionada = 0;

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home), 
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.star), 
          label: 'Favoritos',
        ),
      ],
      onDestinationSelected:(int paginaSelecionada) {
        if(paginaSelecionada == 0){
          paginaSelecionada = 0;
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) {
                return Plants();
              },
            ),
          );
        }
        else if(paginaSelecionada != 0){
          paginaSelecionada = 1;
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) {
                return Favorites();
              },
            ),
          );
        }
      },
      selectedIndex: paginaSelecionada,
    );
  }
}