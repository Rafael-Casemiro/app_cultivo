import 'package:flutter/material.dart';
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
    fontSize: 18,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle textDetails = TextStyle(
    color: Colors.green,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subTextDetails = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle nomeDetails = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sciDetails = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle seasonDetails = TextStyle(
    fontSize: 18
  );
}

const availablePlants = [
  Plant(
    id: 'p1',
    name: 'Laranja',
    sciname: 'Citrus × sinensis',
    season: 'Primavera',
    description: 'A laranja é o fruto do laranjeiro, originária da China meridional, um híbrido entre pomelo (Citrus maxima) e tangerina (Citrus reticulata), O Brasil é o maior produtor mundial de laranja com área total de plantio é estimada em 800 mil hectares.',
    imagePath: 'assets/images/laranja.jpg',
    instructions: 'O plantio das mudas de laranja deve ser realizado em covas com dimensões de 40 cm x 40 cm x 40 cm, com espaçamento de 6 a 8 metros entre as plantas. O ideal é que o plantio seja feito no início da estação chuvosa, para que as mudas possam aproveitar a umidade do solo. É recomendado também fazer a irrigação no período seco.\n\nA poda é um dos cuidados mais importantes, pois ela ajuda a controlar o tamanho das árvores, remover os galhos mortos e doentes, além de estimular o crescimento e a produção de frutos. As laranjas não amadurecem mais após a colheita, por isso, é fundamental colher no momento certo para obter frutos de qualidade.',
    isFavorite: false,
  ),
  Plant(
    id: 'p2',
    name: 'Milho',
    sciname: 'Zea mays',
    season: 'Outono e Primavera',
    description: 'O milho é uma das principais culturas agrícolas do Brasil, utilizado na alimentação humana, animal e na indústria.',
    imagePath: 'assets/images/milho.jpg',
    instructions: 'O milho é cultura de sol pleno e, portanto, não deve ser cultivado à sombra, necessitando de algumas horas de exposição solar todos os dias. O milho é uma planta que exige muita água. A acidez deve estar na faixa de pH entre 5,5 e 6,8, qualquer necessidade de correção deve ser providenciada.\n\nPelo modo tradicional, o milho é cultivado com o preparo do solo, fazendo uso de implementos para aração e de gradagem.\n\nPor meio do plantio direto, a movimentação de solo é mínima, havendo manutenção da palhada anterior com benefícios para a estrutura do solo e sua biodiversidade.',
    isFavorite: false,
  ),
  Plant(
    id: 'p3',
    name: 'Soja',
    sciname: 'Glycine max',
    season: 'Outono e Primavera',
    description: 'A soja é uma das culturas mais importantes do Brasil, usada na produção de óleo, ração animal e alimentos.',
    imagePath: 'assets/images/soja.jpg',
    instructions: 'O espaçamento entre as linhas de plantio devem ficar entre 30 a 50 cm, a profundidade ideal para a semeadura da soja é de 3 a 5 cm. Isso permite uma boa germinação dos grãos, o espaçamento recomendado entre as plantas é de 7 a 10 cm.\n\nPara fazer irrigação da planta é necessário manter o solo 50% úmido em dias normais. Nos dias mais quentes essa porcentagem pode aumentar até 75%, dependendo do nível de calor, soja necessita de irrigação todos os dias, e a falta de água pode ser fatal para o plantio.',
    isFavorite: false,
  ),
  Plant(
    id: 'p4',
    name: 'Cana-de-açúcar',
    sciname: 'Saccharum officinarum',
    season: 'Primavera e Verão',
    description: 'Utilizada na produção de açúcar, etanol e cachaça, a cana-de-açúcar é uma cultura de grande importância econômica no Brasil.',
    imagePath: 'assets/images/cana_acucar.jpg',
    instructions: 'A planta precisa de um alto nível de radiação solar e calor para florescer, temperatura ótima de crescimento e clima para plantar cana de açúcar é em torno de 32°C (90°F).\n\nA necessidade hídrica para o plantio de cana de açúcar é de 1500-2500 mm de chuva (em média 25-50 mm por semana) e a umidade relativa preferida no crescimento da cana de açúcar é de pelo menos 50%. O melhor solo para plantio de cana de açúcar é o solo úmido de um metro de profundidade, não encharcado. A acidez ótima do solo para o plantio da cultura é de 6-6,5 pH, e a planta em crescimento é extremamente sensível ao sal.\n\nPara plantar cana de açúcar, o solo deve estar bem aerado, o que significa que, após uma chuva forte, seus poros ficam cheios de ar em mais de 10%.',
    isFavorite: false,
  ),
  Plant(
    id: 'p5',
    name: 'Café',
    sciname: 'Coffea arabica',
    season: 'Outono e Inverno',
    description: 'O Brasil é o maior produtor mundial de café. A planta exige clima ameno, altitude e cuidados com irrigação e poda.',
    imagePath: 'assets/images/cafe.jpg',
    instructions: 'A temperatura ideal de cultivo varia de 18ºC a 23ºC, sendo que seu desenvolvimento pode ser muito prejudicado em temperaturas acima de 30ºC. O regime de chuvas considerado ideal está na faixa de 1200 mm a 1500 mm anuais.\n\nO café é uma planta que apresenta maior dificuldade para se desenvolver em regiões no mesmo nível do mar, sendo que a recomendação é que a plantação ocorra em áreas entre 600 m e 1200 m de altitude. A alta umidade favorece a incidência de pragas, doenças e fermentações indesejáveis. Já a baixa umidade favorece o aparecimento de algumas pragas e prejudica o desenvolvimento da planta.\n\nÉ recomendado que o plantio seja feito em regiões mais planas. É recomendado realizar a análise do solo pelo menos até a camada entre 40 e 60 cm. O espaçamento entre as mudas de café podem variar entre: 1,75–2,00 m x 0,5 m para renque fechado (plantio adensado) e 3,5–4,0 m x 0,5 para renque aberto (largo na rua e fechado na linha, adotada em lavouras mecanizadas).\n\nO início da irrigação deve ser feito após a florada e se estender até o estresse hídrico que antecede a próxima florada, de acordo com o déficit hídrico de cada solo.',
    isFavorite: false,
  ),
  Plant(
    id: 'p6',
    name: 'Feijão',
    sciname: 'Phaseolus vulgaris',
    season: 'Primavera e Verão',
    description: 'Presente na base alimentar brasileira, o feijão é cultivado em diversas regiões e exige solo fértil e irrigação moderada.',
    imagePath: 'assets/images/feijao.jpg',
    instructions: 'A temperatura ideal de produção de feijão é de 21 °C. A faixa de 18 °C e 24 °C. O ideal é que as plantas de feijão consigam interceptar a maior quantidade de radiação solar possível no período vegetativo.\n\nA quantidade de chuvas ideias durante o ciclo do feijoeiro é de 300 mm a 400 mm e o excesso de chuvas em locais de acúmulo de água reduz o tamanho das plantas e favorece doenças no feijão. As plantas podem morrer nessas condições.\n\nAs plantas de feijão preferem solos soltos, fofos, bem areados, ricos em matéria orgânica e livres de encharcamento e o pH do solo deve estar entre 6 e 7. A saturação por bases ideal é acima de 70%. O preparo do solo convencional é realizado normalmente com discos como arados, grades pesadas ou arado de aiveca. Em solos arenosos, a profundidade ideal de plantio é de 5 a 6 centímetros. Em solos argilosos, por sua vez, é ideal semear com profundidade de 3 a 4 centímetros. A média recomendada é de no mínimo 10 e no máximo 15 sementes a cada metro.\n\nFeijões do tipo 1 e 2 requerem um espaçamento em torno de 40 cm a 50 cm entre linhas.  Para feijões do tipo 3, o espaçamento varia de 50 cm a 60 cm entre linhas.',
    isFavorite: false,
  ),
  Plant(
    id: 'p7',
    name: 'Arroz',
    sciname: 'Oryza sativa',
    season: 'Verão',
    description: 'O arroz é essencial na alimentação brasileira. Cultivado principalmente em áreas irrigadas, exige manejo cuidadoso da água.',
    imagePath: 'assets/images/arroz.jpg',
    instructions: 'O ideal é selecionar áreas próximas a rios, lagos ou com boa incidência de chuvas, onde a irrigação seja tecnicamente viável e eficiente.\n\nÉ importante que o solo seja fértil, bem drenado e com pH entre 5,5 e 6,5, ajustado com base em análise e correções necessárias.\n\nArroz sequeiro há um menor custo de implantação, ele não necessita de irrigação, não exige área plana nem um maquinário específico.\n\nA implantação da lavoura de arroz irrigado depende de um sistema de irrigação por inundação. Além disso, precisa de uma oferta abundante de água durante o desenvolvimento até próximo da colheita. Para o plantio de arroz com o sistema irrigado, você deve dividir a área em quadras. Proceda a irrigação através de um canal central, que distribui a água para todas as quadras.',
    isFavorite: false,
  ),
  Plant(
    id: 'p8',
    name: 'Mandioca',
    sciname: 'Manihot esculenta',
    season: 'Ano todo',
    description: 'Base da alimentação indígena e nordestina, a mandioca é resistente à seca e cultivada em solos menos férteis.',
    imagePath: 'assets/images/mandioca.jpg',
    instructions: 'Tenha cuidado com extremos de temperatura: qualquer coisa acima de 32°C ou abaixo de 20°C estressará a planta, e temperaturas abaixo de 10°C interromperão completamente o crescimento da cultura.\n\nA luz solar não é negociável para a mandioca em crescimento — coloque-a em um local com sol pleno e direto e evite qualquer área com sombra, pois a mandioca não tolera luz limitada.\n\nProcure sinais de solo saudável, como a presença de minhocas e crescimento de vegetação, priorize terrenos planos ou com leve inclinação, com um gradiente que não ultrapasse 15%. O método mais eficaz sobre a profundidade para plantar mandioca envolve: Aração profunda de 15 a 30 cm para soltar o solo. Gradagem com discos a aproximadamente 10 cm para refinar a estrutura do solo. Levantamento de leiras (camalhões ou sulcos) para melhorar a drenagem e aeração.\n\nPropagação por estacas: é o método preferido para o plantar comercialmente. Use segmentos de caule saudáveis, livres de pragas, com comprimento entre 9 e 30 cm e pelo menos um nó. As estacas podem ser plantadas verticalmente ou na posição horizontal, entre 5 e 10 cm abaixo da superfície do solo, garantindo umidade e acesso aos nutrientes.',
    isFavorite: false,
  ),
  Plant(
    id: 'p9',
    name: 'Algodão',
    sciname: 'Gossypium hirsutum',
    season: 'Primavera e Verão',
    description: 'O algodão é usado na indústria têxtil e exige clima quente e seco, além de solo fértil e controle de pragas.',
    imagePath: 'assets/images/algodao.jpg',
    instructions: 'A planta do algodão requer um ciclo de cultivo de aproximadamente 180 dias e de 700 a 900mm de água bem distribuídos.\n\nEm cultivares de uso comercial, 40 a 70 dias após a semeadura inicia-se o florescimento (período reprodutivo), que se encerra com a maturação dos frutos (capulhos).\n\nO sistema radicular do algodão é muito sensível à compactação. Para descompactar o solo é preciso utilizar um subsolador para quebrar as camadas de compactação abaixo da superfície. É possível aproveitar essa operação para realizar a aplicação da primeira dose de calcário e gesso.\n\nEm relação à nutrição, o algodoeiro é uma planta considerada exigente e responsiva à adubação, é possível notar a demanda destacada por nitrogênio (N), potássio (K), enxofre (S), magnésio (Mg) e boro (B).',
    isFavorite: false,
  ),
  Plant(
    id: 'p10',
    name: 'Banana',
    sciname: 'Musa spp.',
    season: 'Ano todo',
    description: 'Fruta tropical amplamente consumida, a banana é cultivada em diversas regiões e exige solo fértil e irrigação constante.',
    imagePath: 'assets/images/banana.jpg',
    instructions: 'As condições ideais para plantar bananas são quentes e úmidas. O clima ideal para plantar banana permite que elas cresçam em regiões de encostas, até uma altitude de 1200 metros.\n\nTemperaturas consistentemente quentes, na faixa de 26°C a 30°C, são preferidas para plantar bananas. Temperaturas abaixo de 15°C podem retardar o crescimento da planta e do fruto. Durante o verão, ventos quentes e fortes podem rasgar as folhas e desidratá-las.\n\nPara uma colheita abundante, são necessárias, no mínimo, 8 horas diárias de luz solar. A cultura em crescimento necessita de cerca de 100 a 250 mm de água por mês. No entanto, o encharcamento pode prejudicar as raízes, portanto, uma boa drenagem é crucial.\n\nO solo ideal para o cultivo de bananas é rico em matéria orgânica, profundo — entre 0,5 e 1 metro —, retém bem a umidade e tem boa drenagem. O espaçamento para plantar banana varia geralmente de 2 por 2 metros a 5 por 5 metros. Esse espaçamento também influencia a densidade ao plantar banana, que pode variar de 160 a 1010 plantas por acre (400 a 2500 plantas por hectare).',
    isFavorite: false,
  ),
  Plant(
    id: 'p11',
    name: 'Tomate',
    sciname: 'Solanum lycopersicum',
    season: 'Primavera e Verão',
    description: 'O tomate é uma planta herbácea cultivada amplamente no Brasil, utilizada em saladas, molhos e diversos pratos. Requer boa luminosidade, irrigação regular e solo fértil.',
    imagePath: 'assets/images/tomate.jpg',
    instructions: 'Certifique-se de que as plantas em crescimento tenham acesso a sol pleno por pelo menos 8 horas por dia é essencial para o plantar as culturas saudáveis.\n\nEles também precisam de um ambiente acolhedor; temperaturas para plantar do tomateiro entre 22 e 29°C serão ideais.\n\nA umidade relativa ideal para plantar tomates é algo entre 65 e 85%. As necessidades hídricas do tomateiro são de 1 a 2 polegadas (2,5 a 5mm) de umidade a cada semana para plantar e produzir bem.\n\nPara plantar, os tomates cultivados no campo prosperam em quase todos os tipos de solo, eles crescem melhor em solo franco-arenoso que drena bem e tem um pH de 6,2 a 6,8.\n\nO solo ideal para plantar tomate deve ser rico em fósforo (P), potássio (K), cálcio (Ca) e magnésio (Mg). O mínimo para a temperatura do solo é de 14 °C; o ideal é entre 18 e 21°C. Ao arar a uma profundidade de 23,6 polegadas (60 cm) após a remoção de ervas daninhas e resíduos de culturas, os agricultores melhoram a drenagem e a aeração do solo.\n\nLogo antes do plantio, lavre o solo a uma profundidade para plantar tomate de 12 a 18 polegadas (30 a 45 cm) para incentivar um sistema radicular mais robusto.\n\nUm transplante de alta qualidade leva cerca de 5 a 7 semanas para plantar. Manter as temperaturas noturnas acima de 15°C incentiva o rápido desenvolvimento.\n\nA altura média dos transplantes é de 8 polegadas (20 cm), e cada um deles tem cerca de 3 a 5 folhas verdadeiras. Lembre-se de que as mudas não estão prontas para o transplante até que cresçam algumas folhas verdadeiras.',
    isFavorite: false,
  ),
];
