import 'package:app_cultivo/models/models.dart';

class KTexts {
  static const String tituloApp = "Título Provisório";
}

class KTextStyles{
  static const TextStyle tituloCard = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sciDesc = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );
}

const availablePlants = [
  Plant(
    id: 'p1',
    name: 'Tomate',
    sciname: 'Solanum lycopersicum',
    climate: 'Tropical a subtropical',
    soil: 'Bem drenado, rico em matéria orgânica',
    season: 'Primavera e verão',
    description: 'O tomate é uma planta herbácea cultivada amplamente no Brasil, utilizada em saladas, molhos e diversos pratos. Requer boa luminosidade, irrigação regular e solo fértil.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Tomatoes-on-the-bush.jpg',
    instructions: 'Plantar em local ensolarado, irrigar regularmente e adubar com composto orgânico.',
  ),
  Plant(
    id: 'p2',
    name: 'Milho',
    sciname: 'Zea mays',
    climate: 'Tropical e subtropical',
    soil: 'Profundo, bem drenado, rico em nutrientes',
    season: 'Outono e primavera',
    description: 'O milho é uma das principais culturas agrícolas do Brasil, utilizado na alimentação humana, animal e na indústria.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/fe/GEM_corn.jpg',
    instructions: 'Semear em linhas espaçadas, irrigar moderadamente e controlar pragas.',
  ),
  Plant(
    id: 'p3',
    name: 'Soja',
    sciname: 'Glycine max',
    climate: 'Subtropical a temperado',
    soil: 'Bem drenado, fértil, pH entre 6 e 7',
    season: 'Outono e primavera',
    description: 'A soja é uma das culturas mais importantes do Brasil, usada na produção de óleo, ração animal e alimentos.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/82/Soybean.USDA.jpg',
    instructions: 'Plantar em solo corrigido, irrigar conforme necessidade e realizar rotação de culturas.',
  ),
  Plant(
    id: 'p4',
    name: 'Cana-de-açúcar',
    sciname: 'Saccharum officinarum',
    climate: 'Tropical',
    soil: 'Profundo, bem drenado, rico em matéria orgânica',
    season: 'Primavera e verão',
    description: 'Utilizada na produção de açúcar, etanol e cachaça, a cana-de-açúcar é uma cultura de grande importância econômica no Brasil.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Saccharum_officinarum%2C_Mozambique.jpg',
    instructions: 'Plantar em sulcos profundos, irrigar bem e aplicar fertilizantes orgânicos.',
  ),
  Plant(
    id: 'p5',
    name: 'Café',
    sciname: 'Coffea arabica',
    climate: 'Tropical com altitude',
    soil: 'Bem drenado, rico em matéria orgânica',
    season: 'Outono e inverno',
    description: 'O Brasil é o maior produtor mundial de café. A planta exige clima ameno, altitude e cuidados com irrigação e poda.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Roasted_coffee_beans.jpg',
    instructions: 'Cultivar em áreas elevadas, podar regularmente e irrigar com moderação.',
  ),
  Plant(
    id: 'p6',
    name: 'Feijão',
    sciname: 'Phaseolus vulgaris',
    climate: 'Tropical a subtropical',
    soil: 'Leve, bem drenado, fértil',
    season: 'Primavera e verão',
    description: 'Presente na base alimentar brasileira, o feijão é cultivado em diversas regiões e exige solo fértil e irrigação moderada.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/47/Six_bean_varieties_at_a_gene_bank.jpg',
    instructions: 'Semear em covas rasas, irrigar regularmente e evitar encharcamento.',
  ),
  Plant(
    id: 'p7',
    name: 'Arroz',
    sciname: 'Oryza sativa',
    climate: 'Tropical úmido',
    soil: 'Alagado, rico em nutrientes',
    season: 'Verão',
    description: 'O arroz é essencial na alimentação brasileira. Cultivado principalmente em áreas irrigadas, exige manejo cuidadoso da água.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7b/White%2C_Brown%2C_Red_%26_Wild_rice.jpg',
    instructions: 'Cultivar em áreas alagadas, controlar ervas daninhas e manter irrigação constante.',
  ),
  Plant(
    id: 'p8',
    name: 'Mandioca',
    sciname: 'Manihot esculenta',
    climate: 'Tropical',
    soil: 'Bem drenado, arenoso, pobre a moderado em nutrientes',
    season: 'Ano todo',
    description: 'Base da alimentação indígena e nordestina, a mandioca é resistente à seca e cultivada em solos menos férteis.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8f/Manihot_esculenta_dsc07325.jpg',
    instructions: 'Plantar em solo arenoso, espaçar bem as mudas e colher após 8 a 12 meses.',
  ),
  Plant(
    id: 'p9',
    name: 'Algodão',
    sciname: 'Gossypium hirsutum',
    climate: 'Semiárido a tropical',
    soil: 'Bem drenado, fértil',
    season: 'Primavera e verão',
    description: 'O algodão é usado na indústria têxtil e exige clima quente e seco, além de solo fértil e controle de pragas.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/28/Cotton_-_%E0%B4%AA%E0%B4%B0%E0%B5%81%E0%B4%A4%E0%B5%8D%E0%B4%A4%E0%B4%BF_03.JPG',
    instructions: 'Semear em solo fértil, aplicar defensivos agrícolas e colher após 150 dias.',
  ),
  Plant(
    id: 'p10',
    name: 'Banana',
    sciname: 'Musa spp.',
    climate: 'Tropical úmido',
    soil: 'Profundo, bem drenado, rico em matéria orgânica',
    season: 'Ano todo',
    description: 'Fruta tropical amplamente consumida, a banana é cultivada em diversas regiões e exige solo fértil e irrigação constante.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/af/Bananas_%28Alabama_Extension%29.jpg',
    instructions: 'Plantar em covas profundas, irrigar frequentemente e proteger contra ventos fortes.',
  ),
];
