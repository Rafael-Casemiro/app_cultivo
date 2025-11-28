// Tela de detalhes da planta
import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/providers/favorites_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/models/models.dart';

// Classe que representa a tela de detalhes da planta
class PlantsDetailsScreen extends ConsumerWidget {
  const PlantsDetailsScreen({
    super.key,
    required this.plant, // Recebe os dados da planta selecionada
    required this.onToggleFavorite, // Função para alternar o status de favorito
  });

  final Plant plant;
  final void Function(Plant plant) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtém a largura total da tela para usar na lógica de responsividade mais abaixo
    double widthScreen = MediaQuery.of(context).size.width;

    // 'ref.watch' fica observando o provider de favoritos.
    // Sempre que alguém favoritar/desfavoritar uma planta, o Flutter reconstrói esta tela automaticamente.
    final favoritesPlants = ref.watch(favoritePlantsProvider);

    // Verifica se a planta atual (this.plant) está dentro da lista de favoritos
    // para decidir qual ícone mostrar (cheio ou vazio).
    final isFavorite = favoritesPlants.contains(plant);

    return Scaffold(
      // Define a cor de fundo da tela usando o tema atual
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(plant.name),
        centerTitle: true,
        actions: [
          // Botão de favorito na AppBar
          IconButton(
            // Mostra o ícone de estrela cheio ou vazio baseado no status de favorito
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              // Ao pressionar o botão, chama a função para alternar o status de favorito
              onToggleFavorite(plant);
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          
          return FractionallySizedBox(
            // Se a tela for larga (> 500px, ex: tablet), usa 50% da largura. 
            // Se for celular, usa 100% da largura.
            widthFactor: widthScreen > 500 ? 0.5 : 1.0,
            child: ListView( // Usa ListView para permitir rolagem do conteúdo
              children: [
                // Exibe a imagem da planta e suas informações básicas
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mostra a imagem da planta com bordas arredondadas
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          plant.imagePath!,
                          height: 170,
                          width: 170,
                          fit: BoxFit.cover, // Garante que a imagem preencha o espaço definido
                        ),
                      ),
                    ),
                    // Coluna com o nome, nome científico e estação da planta
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(plant.name, style: KTextStyles.nomeDetails),
                          Text(plant.sciname, style: KTextStyles.sciDetails),
                          Text(plant.season, style: KTextStyles.seasonDetails),
                        ],
                      ),
                    ),
                  ],
                ),
                // Linha divisória para separar o cabeçalho das seções de descrição e instruções
                Divider(thickness: 6.5, color: Color(0xffb3d38d)),
                // Seção de descrição e instruções da planta
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Descrição:', style: KTextStyles.textDetails),
                      Text(
                        plant.description,
                        style: KTextStyles.subTextDetails,
                      ),
                      // Separador entre descrição e instruções
                      const SizedBox(height: 18),
                      Text('Instruções:', style: KTextStyles.textDetails),
                      Text(
                        plant.instructions,
                        style: KTextStyles.subTextDetails,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}