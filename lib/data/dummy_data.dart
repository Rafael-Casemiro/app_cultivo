import 'package:flutter/material.dart';
import 'package:comida/models/category.dart';
import 'package:comida/models/meal.dart';

const availableCategories = [
  
  Category(
    id: 'p1',
    name: 'Tomate',
    sciname: 'Solanum lycopersicum',
    climate: 'Tropical a subtropical',
    soil: 'Bem drenado, rico em matéria orgânica',
    season: 'Primavera e verão',
    description: 'O tomate é uma planta herbácea cultivada amplamente no Brasil, utilizada em saladas, molhos e diversos pratos. Requer boa luminosidade, irrigação regular e solo fértil.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
    color: Colors.red,
  ),

  Category(
    id: 'p2',
    name: 'Milho',
    sciname: 'Zea mays',
    climate: 'Tropical e subtropical',
    soil: 'Profundo, bem drenado, rico em nutrientes',
    season: 'Outono e primavera',
    description: 'O milho é uma das principais culturas agrícolas do Brasil, utilizado na alimentação humana, animal e na indústria. Requer boa luminosidade, irrigação moderada e solos férteis para alto rendimento.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Corn_on_the_cob.jpg',
    color: Colors.yellow,
  ),

  Category(
    id: 'p3',
    name: 'Soja',
    sciname: 'Glycine max',
    climate: 'Subtropical a temperado',
    soil: 'Bem drenado, fértil, pH entre 6 e 7',
    season: 'Outono e primavera',
    description: 'A soja é uma das culturas mais importantes do Brasil, usada na produção de óleo, ração animal e alimentos. Requer clima ameno e solo fértil.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Soybean.jpg',
    color: Colors.green,
  ),

  Category(
    id: 'p4',
    name: 'Cana-de-açúcar',
    sciname: 'Saccharum officinarum',
    climate: 'Tropical',
    soil: 'Profundo, bem drenado, rico em matéria orgânica',
    season: 'Primavera e verão',
    description: 'Utilizada na produção de açúcar, etanol e cachaça, a cana-de-açúcar é uma cultura de grande importância econômica no Brasil.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Sugarcane.jpg',
    color: Colors.lightGreen,
  ),

  Category(
    id: 'p5',
    name: 'Café',
    sciname: 'Coffea arabica',
    climate: 'Tropical com altitude',
    soil: 'Bem drenado, rico em matéria orgânica',
    season: 'Outono e inverno',
    description: 'O Brasil é o maior produtor mundial de café. A planta exige clima ameno, altitude e cuidados com irrigação e poda.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/45/Coffee_berries.jpg',
    color: Colors.brown,
  ),

  Category(
    id: 'p6',
    name: 'Feijão',
    sciname: 'Phaseolus vulgaris',
    climate: 'Tropical a subtropical',
    soil: 'Leve, bem drenado, fértil',
    season: 'Primavera e verão',
    description: 'Presente na base alimentar brasileira, o feijão é cultivado em diversas regiões e exige solo fértil e irrigação moderada.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Beans.jpg',
    color: Colors.black,
  ),

  Category(
    id: 'p7',
    name: 'Arroz',
    sciname: 'Oryza sativa',
    climate: 'Tropical úmido',
    soil: 'Alagado, rico em nutrientes',
    season: 'Verão',
    description: 'O arroz é essencial na alimentação brasileira. Cultivado principalmente em áreas irrigadas, exige manejo cuidadoso da água.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Rice_field.jpg',
    color: Colors.white,
  ),
  
  Category(
    id: 'p8',
    name: 'Mandioca',
    sciname: 'Manihot esculenta',
    climate: 'Tropical',
    soil: 'Bem drenado, arenoso, pobre a moderado em nutrientes',
    season: 'Ano todo',
    description: 'Base da alimentação indígena e nordestina, a mandioca é resistente à seca e cultivada em solos menos férteis.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cassava_root.jpg',
    color: Colors.orange,
  ),

  Category(
    id: 'p9',
    name: 'Algodão',
    sciname: 'Gossypium hirsutum',
    climate: 'Semiárido a tropical',
    soil: 'Bem drenado, fértil',
    season: 'Primavera e verão',
    description: 'O algodão é usado na indústria têxtil e exige clima quente e seco, além de solo fértil e controle de pragas.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cotton_bolls.jpg',
    color: Colors.grey,
  ),

  Category(
    id: 'p10',
    name: 'Banana',
    sciname: 'Musa spp.',
    climate: 'Tropical úmido',
    soil: 'Profundo, bem drenado, rico em matéria orgânica',
    season: 'Ano todo',
    description: 'Fruta tropical amplamente consumida, a banana é cultivada em diversas regiões e exige solo fértil e irrigação constante.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
    color: Colors.yellow,
  ),
];