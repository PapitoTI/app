import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:flutter/material.dart';

TouristModel touristModel = TouristModel('assets/images/felipe_turista.jpg',
    'Turista Ferreira de Souza', 'fefsouza10@gmail.com', '+5511968638792');

GuideModel guideModel = GuideModel(
    'assets/images/felipe_guia.jpg',
    'Felipe Ferreira de Souza',
    'fefsouza10@gmail.com',
    '+5511968638792',
    'assets/images/certificado.jpg',
    '100,00'
        '');

List<SpotModel> spotList1 = [
  SpotModel(
    'MASP',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/masp1.jpg',
      'assets/images/masp2.jpg',
      'assets/images/masp3.jpg'
    ],
  ),
  SpotModel(
    'Parque Ibirapuera',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/ibirapuera1.jpg',
      'assets/images/ibirapuera2.jpg',
      'assets/images/ibirapuera3.jpg'
    ],
  ),
  SpotModel(
    'Catedral da Sé',
    'Sé, São Paulo',
    'Monumento',
    'A Catedral da Sé é a igreja mais conhecida de São Paulo. Independente da religião a visita é imperdível.Com sua imponente construção marca também o centro da cidade, na Praça da Sé. A sua arquitetura é de brilhar os olhos! Cercada por vitrais, mosaicos e obras de arte sacra, possui capacidade para 8.000 pessoas, sendo considerada a maior da América do Sul.',
    [
      'assets/images/catedralse1.jpg',
      'assets/images/catedralse2.jpg',
      'assets/images/catedralse3.jpg'
    ],
  ),
];

List<SpotModel> spotListMASP = [
  SpotModel(
    'MASP',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/masp1.jpg',
      'assets/images/masp2.jpg',
      'assets/images/masp3.jpg'
    ],
  ),
];

List<SpotModel> spotList2 = [
  SpotModel(
    'Vale dos Vinhedos',
    'Vale dos vinhedos, Rio Grande do Sul',
    'Cultural',
    'Visitaremos o lindo Vale dos Vinhedos a rota de enoturismo mais procurada do Brasil\nProsseguiremos com o mais novo desenvolvimento do Roteiro: A Cave de Sol, Vinícola com sucos e vinhos premiados.\nEm seguida, visitaremos a Vinícola Marco Luigi, onde o jovem e inovador construiu com seu pai a primeira cantina de pedra com barris de madeira entalhados à mão. Essa paixão faz de Marco Luigi um grande produtor de vinhos, reconhecido na região pela excelência de seus produtos. A fé e o amor ao vinho levaram à construção de uma Igreja local de agradecimento e pedidos de proteção das vinhas.\nDevido a uma grande seca, as obras da Igreja param, mas a devoção leva Marco Luigi e outros moradores a doar vinho para substituir a água do almofariz. E assim, eles veem a conclusão da tão sonhada capela. Essa conquista torna a Igreja de Nossa Senhora das Neves um Patrimônio Histórico, que também iremos visitar.\nPor fim, o almoço será na Risoteria e Café Vallontano, ainda no Vale dos Vinhedos.',
    [
      'assets/images/vinhedos.jpg',
      'assets/images/vinhedos1.jpg',
      'assets/images/vinhedos2.jpg',
    ],
  ),
];
List<SpotModel> spotList3 = [
  SpotModel(
    'Tour Incrível em Gramado e Canela',
    'Gramado, Rio Grande do Sul',
    'Cultural',
    'Entre Gramado e Canela, sempre temos ótimos pontos para providenciar as melhores experiências aos viajantes…\n Por isso, começaremos nosso tour da melhor forma:\niremos no Pórtico de Pedra de Gramado, para tirar aquela foto incrível que você sempre sonhou\nDepois, veremos o Lago Negro, um dos pontos mais atrativos de Gramado, por possuir uma natureza exuberante.\nPartimos então para ver, dentre outras atrações, o Mirante do Vale do Quilombo: um belvedere, ideal para uma bela foto\nVisitaremos nossa famosa Fábrica de Chocolate e finalizaremos o nosso tour na Cascata do Caracol.',
    [
      'assets/images/gramado.jpeg',
      'assets/images/gramado1.jpeg',
      'assets/images/gramado2.jpeg',
    ],
  ),
];
List<SpotModel> spotList4 = [
  SpotModel(
    'Maria Fumaça e a rota dos vinhos',
    'Vale dos vinhedos, Rio Grande do Sul',
    'Cultural',
    'Conheça Gramado de uma forma espetacular e um tanto tradicional: nesta rota, você irá se divertir muito ao som de músicas italianas e gaúchas ao vivo, no passeio de trem Maria Fumaça (preço da  Maria Fumaça nao esta incluso). Muita dança, cultura e boas histórias dos imigrantes Italianos para contar… Isso e muito mais você verá por aqui! ',
    [
      'assets/images/vinho.jpg',
      'assets/images/vinho1.jpg',
      'assets/images/vinho2.jpg',
    ],
  ),
];
List<SpotModel> spotList5 = [
  SpotModel(
    'Circuito das Águas Verdes',
    'Capitólio, Minas Gerais',
    'Adventure',
    'Visitaremos as 5 Cachoeiras e no retorno para Ouro Preto uma parada no apiário e na fábrica dos doces patrimônio imaterial de Ouro Preto, vamos viver uma experiência com produtores rurais.',
    [
      'assets/images/verde.jpg',
      'assets/images/verde1.png',
      'assets/images/verde2.jpg',
    ],
  ),
];
List<SpotModel> spotList6 = [
  SpotModel(
    'City Tour Ouro Preto e Mariana',
    'Ouro Preto, Minas Gerais',
    'Cultural',
    'Ouro Preto é o berço do Barroco Mineiro, aqui poderemos contemplar o mais importante conjunto arquitetônico do Brasil, suas Igrejas, Museus, Pontes, Chafarizes, Casarios e ruínas de mineração.\nMariana é o lugar da religiosidade mineira, tornou-se sede do primeiro bispado da região e foi uma das primeiras cidades planejadas do País, com linhas retas e praças retangulares.',
    [
      'assets/images/ouro.jpg',
      'assets/images/ouro1.png',
      'assets/images/ouro2.jpg',
    ],
  ),
];
List<SpotModel> spotList7 = [
  SpotModel(
    'City Tour Ouro Preto',
    'Ouro Preto, Minas Gerais',
    'CityTour',
    'Ouro Preto é conhecida pela arquitetura barroca, que inclui pontes, fontes e praças, e pelas ruas calcetadas íngremes e sinuosas. A Praça central de Tiradentes recebeu o nome do mártir da independência brasileira.',
    [
      'assets/images/preto.jpg',
      'assets/images/preto1.png',
      'assets/images/preto2.jpg',
    ],
  ),
];
List<SpotModel> spotList8 = [
  SpotModel(
    'Rota gastronômica Ouropretana',
    'Ouro Preto, Minas Gerais',
    'Gastronômico',
    'O estado de Minas Gerais é rico em sua gastronomia e nesta experiência teremos a oportunidade de conhecer as tradições, produtores rurais e patrimônio imaterial de Ouro Preto.',
    [
      'assets/images/ouroc.jpg',
      'assets/images/ouroc1.jpg',
      'assets/images/ouroc2.jpeg',
    ],
  ),
];
List<SpotModel> spotList9 = [
  SpotModel(
    'Passeio a praia Morro Branco',
    'Beberibe, Ceará',
    'Relax',
    'Morro Branco é uma praia localizada no litoral leste, no município de Beberibe, cerca de 80 km da capital, com uma extensão litorânea de aproximadamente 50 km.\nConhecida pelas belas formações de dunas e berço das areias coloridas entre as falésias, os visitantes se encantam com o trabalho da silicografia (arte de desenhar com areias) realizado pelos artesãos, aproveitando desta beleza natural proveniente das suas falésias, o visitante desfrutará mais da excursão através do passeio opcional de Buggy.',
    [
      'assets/images/morro.jpg',
      'assets/images/morro1.jpg',
      'assets/images/morro2.jpg',
    ],
  ),
];
List<SpotModel> spotList10 = [
  SpotModel(
    'Passeio na Praia de Cumbuco',
    'Cumbuco, Ceará',
    'Relax',
    'A Praia de Cumbuco, a cerca de 30 km de carro de Fortaleza, é uma das praias mais procuradas na região metropolitana. Ela está em um vilarejo calmo, com boa estrutura para passar o dia, onde se encontram alguns restaurantes e mar calminho.',
    [
      'assets/images/cumbuco.jpg',
      'assets/images/cumbuco1.jpg',
      'assets/images/cumbuco2.jpg',
    ],
  ),
];
List<SpotModel> spotList11 = [
  SpotModel(
    'Passeio na praia da lagoinha',
    'Lagoinha, Ceará',
    'Relax',
    'Explore a praia de Lagoinha no município de Paraipaba nesta viagem de dia inteiro saindo de Fortaleza. Uma vez esconderijo de tesouro enterrado por piratas franceses, esta área é agora uma tranquila vila de pescadores. Fique à vontade para relaxar na praia ou passear pelas imponentes dunas vermelhas e bailastes palmeiras. Escolha entre uma excursão de buggy, passeio a cavalo ou passeio de jangada (barco à vela) na lagoa das Almécegas.',
    [
      'assets/images/lagoa.jpg',
      'assets/images/lagoa1.jpg',
      'assets/images/lagoa2.jpg',
    ],
  ),
];

List<SpotModel> spotListAll = [
  SpotModel(
    'MASP',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/masp1.jpg',
      'assets/images/masp2.jpg',
      'assets/images/masp3.jpg'
    ],
  ),
  SpotModel(
    'Parque Ibirapuera',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/ibirapuera1.jpg',
      'assets/images/ibirapuera2.jpg',
      'assets/images/ibirapuera3.jpg'
    ],
  ),
  SpotModel(
    'Catedral da Sé',
    'Sé, São Paulo',
    'Monumento',
    'A Catedral da Sé é a igreja mais conhecida de São Paulo. Independente da religião a visita é imperdível.Com sua imponente construção marca também o centro da cidade, na Praça da Sé. A sua arquitetura é de brilhar os olhos! Cercada por vitrais, mosaicos e obras de arte sacra, possui capacidade para 8.000 pessoas, sendo considerada a maior da América do Sul.',
    [
      'assets/images/catedralse1.jpg',
      'assets/images/catedralse2.jpg',
      'assets/images/catedralse3.jpg'
    ],
  ),
  SpotModel(
    'Vale dos Vinhedos',
    'Vale dos vinhedos, Rio Grande do Sul',
    'Cultural',
    'Visitaremos o lindo Vale dos Vinhedos a rota de enoturismo mais procurada do Brasil\nProsseguiremos com o mais novo desenvolvimento do Roteiro: A Cave de Sol, Vinícola com sucos e vinhos premiados.\nEm seguida, visitaremos a Vinícola Marco Luigi, onde o jovem e inovador construiu com seu pai a primeira cantina de pedra com barris de madeira entalhados à mão. Essa paixão faz de Marco Luigi um grande produtor de vinhos, reconhecido na região pela excelência de seus produtos. A fé e o amor ao vinho levaram à construção de uma Igreja local de agradecimento e pedidos de proteção das vinhas.\nDevido a uma grande seca, as obras da Igreja param, mas a devoção leva Marco Luigi e outros moradores a doar vinho para substituir a água do almofariz. E assim, eles veem a conclusão da tão sonhada capela. Essa conquista torna a Igreja de Nossa Senhora das Neves um Patrimônio Histórico, que também iremos visitar.\nPor fim, o almoço será na Risoteria e Café Vallontano, ainda no Vale dos Vinhedos.',
    [
      'assets/images/vinhedos.jpg',
      'assets/images/vinhedos1.jpg',
      'assets/images/vinhedos2.jpg',
    ],
  ),
  SpotModel(
    'Tour Incrível em Gramado e Canela',
    'Gramado, Rio Grande do Sul',
    'Cultural',
    'Entre Gramado e Canela, sempre temos ótimos pontos para providenciar as melhores experiências aos viajantes…\n Por isso, começaremos nosso tour da melhor forma:\niremos no Pórtico de Pedra de Gramado, para tirar aquela foto incrível que você sempre sonhou\nDepois, veremos o Lago Negro, um dos pontos mais atrativos de Gramado, por possuir uma natureza exuberante.\nPartimos então para ver, dentre outras atrações, o Mirante do Vale do Quilombo: um belvedere, ideal para uma bela foto\nVisitaremos nossa famosa Fábrica de Chocolate e finalizaremos o nosso tour na Cascata do Caracol.',
    [
      'assets/images/gramado.jpeg',
      'assets/images/gramado1.jpeg',
      'assets/images/gramado2.jpeg',
    ],
  ),
  SpotModel(
    'Maria Fumaça e a rota dos vinhos',
    'Vale dos vinhedos, Rio Grande do Sul',
    'Cultural',
    'Conheça Gramado de uma forma espetacular e um tanto tradicional: nesta rota, você irá se divertir muito ao som de músicas italianas e gaúchas ao vivo, no passeio de trem Maria Fumaça (preço da  Maria Fumaça nao esta incluso). Muita dança, cultura e boas histórias dos imigrantes Italianos para contar… Isso e muito mais você verá por aqui! ',
    [
      'assets/images/vinho.jpg',
      'assets/images/vinho1.jpg',
      'assets/images/vinho2.jpg',
    ],
  ),
  SpotModel(
    'Maria Fumaça e a rota dos vinhos',
    'Vale dos vinhedos, Rio Grande do Sul',
    'Cultural',
    'Conheça Gramado de uma forma espetacular e um tanto tradicional: nesta rota, você irá se divertir muito ao som de músicas italianas e gaúchas ao vivo, no passeio de trem Maria Fumaça (preço da  Maria Fumaça nao esta incluso). Muita dança, cultura e boas histórias dos imigrantes Italianos para contar… Isso e muito mais você verá por aqui! ',
    [
      'assets/images/vinho.jpg',
      'assets/images/vinho1.jpg',
      'assets/images/vinho2.jpg',
    ],
  ),
  SpotModel(
    'Circuito das Águas Verdes',
    'Capitólio, Minas Gerais',
    'Adventure',
    'Visitaremos as 5 Cachoeiras e no retorno para Ouro Preto uma parada no apiário e na fábrica dos doces patrimônio imaterial de Ouro Preto, vamos viver uma experiência com produtores rurais.',
    [
      'assets/images/verde.jpg',
      'assets/images/verde1.png',
      'assets/images/verde2.jpg',
    ],
  ),
  SpotModel(
    'City Tour Ouro Preto e Mariana',
    'Ouro Preto, Minas Gerais',
    'Cultural',
    'Ouro Preto é o berço do Barroco Mineiro, aqui poderemos contemplar o mais importante conjunto arquitetônico do Brasil, suas Igrejas, Museus, Pontes, Chafarizes, Casarios e ruínas de mineração.\nMariana é o lugar da religiosidade mineira, tornou-se sede do primeiro bispado da região e foi uma das primeiras cidades planejadas do País, com linhas retas e praças retangulares.',
    [
      'assets/images/ouro.jpg',
      'assets/images/ouro1.png',
      'assets/images/ouro2.jpg',
    ],
  ),
  SpotModel(
    'City Tour Ouro Preto',
    'Ouro Preto, Minas Gerais',
    'CityTour',
    'Ouro Preto é conhecida pela arquitetura barroca, que inclui pontes, fontes e praças, e pelas ruas calcetadas íngremes e sinuosas. A Praça central de Tiradentes recebeu o nome do mártir da independência brasileira.',
    [
      'assets/images/preto.jpg',
      'assets/images/preto1.png',
      'assets/images/preto2.jpg',
    ],
  ),
  SpotModel(
    'Rota gastronômica Ouropretana',
    'Ouro Preto, Minas Gerais',
    'Gastronômico',
    'O estado de Minas Gerais é rico em sua gastronomia e nesta experiência teremos a oportunidade de conhecer as tradições, produtores rurais e patrimônio imaterial de Ouro Preto.',
    [
      'assets/images/ouroc.jpg',
      'assets/images/ouroc1.jpg',
      'assets/images/ouroc2.jpeg',
    ],
  ),
  SpotModel(
    'Passeio a praia Morro Branco',
    'Beberibe, Ceará',
    'Relax',
    'Morro Branco é uma praia localizada no litoral leste, no município de Beberibe, cerca de 80 km da capital, com uma extensão litorânea de aproximadamente 50 km.\nConhecida pelas belas formações de dunas e berço das areias coloridas entre as falésias, os visitantes se encantam com o trabalho da silicografia (arte de desenhar com areias) realizado pelos artesãos, aproveitando desta beleza natural proveniente das suas falésias, o visitante desfrutará mais da excursão através do passeio opcional de Buggy.',
    [
      'assets/images/morro.jpg',
      'assets/images/morro1.jpg',
      'assets/images/morro2.jpg',
    ],
  ),
  SpotModel(
    'Passeio na Praia de Cumbuco',
    'Cumbuco, Ceará',
    'Relax',
    'A Praia de Cumbuco, a cerca de 30 km de carro de Fortaleza, é uma das praias mais procuradas na região metropolitana. Ela está em um vilarejo calmo, com boa estrutura para passar o dia, onde se encontram alguns restaurantes e mar calminho.',
    [
      'assets/images/cumbuco.jpg',
      'assets/images/cumbuco1.jpg',
      'assets/images/cumbuco2.jpg',
    ],
  ),
  // SpotModel(
  //   'Passeio na praia da lagoinha',
  //   'Lagoinha, Ceará',
  //   'Relax',
  //   'Explore a praia de Lagoinha no município de Paraipaba nesta viagem de dia inteiro saindo de Fortaleza. Uma vez esconderijo de tesouro enterrado por piratas franceses, esta área é agora uma tranquila vila de pescadores. Fique à vontade para relaxar na praia ou passear pelas imponentes dunas vermelhas e bailastes palmeiras. Escolha entre uma excursão de buggy, passeio a cavalo ou passeio de jangada (barco à vela) na lagoa das Almécegas.',
  //   [
  //     'assets/images/lagoa.jpg',
  //     'assets/images/lagoa1.jpg',
  //     'assets/images/lagoa2.jpg',
  //   ],
  // ),
  // SpotModel(
  //   'Jericoacoara',
  //   'Jijoca, Ceará',
  //   'Adventure',
  //   'Esse passeio é ideal para você que deseja conhecer este paraíso, mas tem pouco tempo de estadia no Ceará.',
  //   [
  //     'assets/images/jeri.jpg',
  //     'assets/images/jeri1.png',
  //     'assets/images/jeri2.jpg',
  //   ],
  // ),
  // SpotModel(
  //   'Pub Crawl na Ilha do Amor',
  //   'São Luis, Maranhão',
  //   'CityTour',
  //   'Iremos visitar 5 dos mais charmosos e populares pubs da ilha de São Luís do Maranhão, passaremos por locais nas praias, lagoas e centro histórico da ilha com drinks de assinatura incluídos em cada uma das nossas paradas.',
  //   [
  //     'assets/images/ilham.jpg',
  //     'assets/images/ilham1.jpg',
  //     'assets/images/ilham2.jpg',
  //   ],
  // ),
  // SpotModel(
  //   'Tour em Paraty',
  //   'Paraty, Rio de janeiro',
  //   'Cultural',
  //   'Nesse tour você poderá conhecer um pouco mais sobre sua história, passeando pelo Centro Histórico, famoso por suas ruas de pedras "pés-de-moleque", seus grandiosos eventos como a FLIP, seus bares, restaurantes e não pode faltar suas belíssimas praias, incluindo as praias de Trindade, 25 km do centro.',
  //   [
  //     'assets/images/paraty.jpeg',
  //     'assets/images/paraty1.jpg',
  //     'assets/images/paraty2.jpg',
  //   ],
  // ),
  // SpotModel(
  //   'City Tour em Arraial do Cabo',
  //   'Arraial do Cabo, Rio de janeiro',
  //   'CityTour',
  //   'Conheça o Caribe Brasileiro! Praias de areias brancas e águas cristalinas com belezas naturais de tirar o fôlego!  Venha desfrutar dessa reserva ecológica num fabuloso passeio de barco.',
  //   [
  //     'assets/images/arraial.jpg',
  //     'assets/images/arraial1.jpg',
  //     'assets/images/arraial2.jpg',
  //   ],
  // ),
];

var guidesDB = [
  {
    'imageUrl': 'assets/images/felipe_guia.jpg',
    'name': 'Felipe Ferreira de Souza',
    'email': 'fefsouza10@gmail.com',
    'phone': '+5511968638792',
    'certificate': 'assets/images/certificado.jpg',
    'accountBalance': '100,00'
  }
];

List<Duration> spotDuration = [
  Duration(hours: 2, minutes: 30),
  Duration(hours: 3, minutes: 45),
  Duration(hours: 1, minutes: 15),
];

final List<bool> weekdays = [false, true, true, true, true, true, false];

List<ExtraSpotModel> itineraryAddsList = [];

List<ItineraryModel> itinerariesDB = [
  //
  // ItineraryModel(
  //     guideModel,
  //     'Passeio a praia da Lagoinha',
  //     spotListAll,
  //     spotDuration,
  //     sessionsList,
  //     'Explore a praia de Lagoinha no município de Paraipaba nesta viagem de dia inteiro saindo de Fortaleza. Uma vez esconderijo de tesouro enterrado por piratas franceses, esta área é agora uma tranquila vila de pescadores. Fique à vontade para relaxar na praia ou passear pelas imponentes dunas vermelhas e bailastes palmeiras. Escolha entre uma excursão de buggy, passeio a cavalo ou passeio de jangada (barco à vela) na lagoa das Almécegas.',
  //     'Relax',
  //     weekdays,
  //     itineraryAddsList,
  //     115.00,
  //     ItineraryType.Guide),
  // //
  // ItineraryModel(
  //     guideModel,
  //     'Jericoacoara',
  //     spotListAll,
  //     spotDuration,
  //     sessionsList,
  //     'Esse passeio é ideal para você que deseja conhecer este paraíso, mas tem pouco tempo de estadia no Ceará.',
  //     'Adveture',
  //     weekdays,
  //     itineraryAddsList,
  //     320.00,
  //     ItineraryType.Guide),
  // //
  // ItineraryModel(
  //     guideModel,
  //     'Pub Crawl na Ilha do Amor',
  //     spotListAll,
  //     spotDuration,
  //     sessionsList,
  //     'Iremos visitar 5 dos mais charmosos e populares pubs da ilha de São Luís do Maranhão, passaremos por locais nas praias, lagoas e centro histórico da ilha com drinks de assinatura incluídos em cada uma das nossas paradas.',
  //     'CityTour',
  //     weekdays,
  //     itineraryAddsList,
  //     290.00,
  //     ItineraryType.Guide),
  // //
  // ItineraryModel(
  //     guideModel,
  //     'Tour em Paraty',
  //     spotListAll,
  //     spotDuration,
  //     sessionsList,
  //     'Nesse tour você poderá conhecer um pouco mais sobre sua história, passeando pelo Centro Histórico, famoso por suas ruas de pedras "pés-de-moleque", seus grandiosos eventos como a FLIP, seus bares, restaurantes e não pode faltar suas belíssimas praias, incluindo as praias de Trindade, 25 km do centro.',
  //     'Cultural',
  //     weekdays,
  //     itineraryAddsList,
  //     425.00,
  //     ItineraryType.Guide),
  // //
  // ItineraryModel(
  //     guideModel,
  //     'Ilha Grande - Dois Rios e Praia do Caxadaço',
  //     spotListAll,
  //     spotDuration,
  //     sessionsList,
  //     'A Ilha Grande está localizada entre as duas maiores cidades do Brasil, Rio de Janeiro e São Paulo. Faz parte da Costa Verde e é destino de muitos turistas. Banhada pelo oceano Atlântico e a baía da Ilha Grande e também coberta pela mata atlântica. Praias , trilhas, cachoeiras, fauna e flora são os atrativos naturais que atraem seus visitantes ao lado da importância histórica e cultural.',
  //     'Adventure',
  //     weekdays,
  //     itineraryAddsList,
  //     385.00,
  //     ItineraryType.Guide),
  // //
  // ItineraryModel(
  //     guideModel,
  //     'City Tour em Arraial do Cabo',
  //     spotListAll,
  //     spotDuration,
  //     sessionsList,
  //     'Conheça o Caribe Brasileiro! Praias de areias brancas e águas cristalinas com belezas naturais de tirar o fôlego!  Venha desfrutar dessa reserva ecológica num fabuloso passeio de barco.',
  //     'CityTour',
  //     weekdays,
  //     itineraryAddsList,
  //     209.00,
  //     ItineraryType.Guide),
];

DateTime dateItinerary = DateTime.utc(2021, 10, 25, 10, 00);
DateTime dateItinerary2 = DateTime.utc(2021, 10, 25, 16, 00);

TimeOfDay session1 = TimeOfDay(hour: 10, minute: 00);
TimeOfDay session2 = TimeOfDay(hour: 16, minute: 00);
TimeOfDay session3 = TimeOfDay(hour: 21, minute: 00);

List<TimeOfDay> sessionsList = [session1, session2, session3];

ItineraryModel itineraryModel1 = ItineraryModel(
    guideModel,
    'Rolê em SP',
    spotList1,
    spotDuration,
    sessionsList,
    'Este roteiro passa por vários lugares de São Paulo, aproveite!',
    'Rolê',
    [false, true, true, true, true, true, false],
    itineraryAddsList,
    300.00,
    ItineraryType.Guide);

ItineraryModel itineraryModel2 = ItineraryModel(
    guideModel,
    'Rolê no MASP',
    spotListMASP,
    spotDuration,
    sessionsList,
    'Este roteiro passa por vários lugares de São Paulo, aproveite!',
    'Rolê',
    weekdays,
    itineraryAddsList,
    120.00,
    ItineraryType.Guide);

// ItineraryModel itineraryModel3 = ItineraryModel(
//     guideModel,
//     'Cânions Itaimbezinho e Fortaleza em Gramado',
//     spotList2,
//     spotDuration,
//     sessionsList,
//     'A Romântica Serra Gaúcha no Rio Grande do Sul, reserva sempre algo a mais.\nIremos ao Cânion Itaimbezinho, que está localizado no Parque Nacional Aparados da Serra, na cidade de Cambará do Sul. Sendo um passeio para crianças, idosos, pessoas com deficiência e de fácil acesso, o Cânion Itaimbezinho é o maior cânion da América Latina, promovendo experiências incríveis para os mais diversos viajantes.\nO Cânion, possui dois acessos, na parte alta em Cambará do Sul, e a parte baixa, na qual entramos por Praia Grande, em Santa Catarina. Nesse maravilhoso tour focaremos em duas trilhas inesquecíveis, na parte alta a trilha do vértice e a trilha do cotovelo.\nVocê verá uma vista lindíssima de 360º na nossa querida serra.\nO destaque especial vai para o cenário privilegiado da Cascata das Andorinhas, com uma queda de aproximadamente 200m de altura, vista da trilha do Vértice.  Simplesmente, uma vista de tirar o fôlego!',
//     'Adventure',
//     weekdays,
//     itineraryAddsList,
//     225.00,
//     ItineraryType.Guide);
ItineraryModel itineraryModel4 = ItineraryModel(
    guideModel,
    'Vale dos Vinhedos',
    spotList2,
    spotDuration,
    sessionsList,
    'Visitaremos o lindo Vale dos Vinhedos a rota de enoturismo mais procurada do Brasil\nProsseguiremos com o mais novo desenvolvimento do Roteiro: A Cave de Sol, Vinícola com sucos e vinhos premiados.\nEm seguida, visitaremos a Vinícola Marco Luigi, onde o jovem e inovador construiu com seu pai a primeira cantina de pedra com barris de madeira entalhados à mão. Essa paixão faz de Marco Luigi um grande produtor de vinhos, reconhecido na região pela excelência de seus produtos. A fé e o amor ao vinho levaram à construção de uma Igreja local de agradecimento e pedidos de proteção das vinhas.\nDevido a uma grande seca, as obras da Igreja param, mas a devoção leva Marco Luigi e outros moradores a doar vinho para substituir a água do almofariz. E assim, eles veem a conclusão da tão sonhada capela. Essa conquista torna a Igreja de Nossa Senhora das Neves um Patrimônio Histórico, que também iremos visitar.\nPor fim, o almoço será na Risoteria e Café Vallontano, ainda no Vale dos Vinhedos.',
    'Cultural',
    weekdays,
    itineraryAddsList,
    500.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel5 = ItineraryModel(
    guideModel,
    'Tour Incrível em Gramado e Canela',
    spotList3,
    spotDuration,
    sessionsList,
    'Entre Gramado e Canela, sempre temos ótimos pontos para providenciar as melhores experiências aos viajantes…\n Por isso, começaremos nosso tour da melhor forma:\niremos no Pórtico de Pedra de Gramado, para tirar aquela foto incrível que você sempre sonhou\nDepois, veremos o Lago Negro, um dos pontos mais atrativos de Gramado, por possuir uma natureza exuberante.\nPartimos então para ver, dentre outras atrações, o Mirante do Vale do Quilombo: um belvedere, ideal para uma bela foto\nVisitaremos nossa famosa Fábrica de Chocolate e finalizaremos o nosso tour na Cascata do Caracol.',
    'Cultural',
    weekdays,
    itineraryAddsList,
    325.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel6 = ItineraryModel(
    guideModel,
    'Maria Fumaça e a rota dos vinhos',
    spotList4,
    spotDuration,
    sessionsList,
    'Conheça Gramado de uma forma espetacular e um tanto tradicional: nesta rota, você irá se divertir muito ao som de músicas italianas e gaúchas ao vivo, no passeio de trem Maria Fumaça (preço da  Maria Fumaça nao esta incluso). Muita dança, cultura e boas histórias dos imigrantes Italianos para contar… Isso e muito mais você verá por aqui! ',
    'Cultural',
    weekdays,
    itineraryAddsList,
    325.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel7 = ItineraryModel(
    guideModel,
    'Circuito das Águas Verdes',
    spotList5,
    spotDuration,
    sessionsList,
    'Visitaremos as 5 Cachoeiras e no retorno para Ouro Preto uma parada no apiário e na fábrica dos doces patrimônio imaterial de Ouro Preto, vamos viver uma experiência com produtores rurais.',
    'Adventure',
    weekdays,
    itineraryAddsList,
    220.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel8 = ItineraryModel(
    guideModel,
    'City Tour Ouro Preto e Mariana',
    spotList6,
    spotDuration,
    sessionsList,
    'Ouro Preto é o berço do Barroco Mineiro, aqui poderemos contemplar o mais importante conjunto arquitetônico do Brasil, suas Igrejas, Museus, Pontes, Chafarizes, Casarios e ruínas de mineração.\nMariana é o lugar da religiosidade mineira, tornou-se sede do primeiro bispado da região e foi uma das primeiras cidades planejadas do País, com linhas retas e praças retangulares.',
    'Cultural',
    weekdays,
    itineraryAddsList,
    150.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel9 = ItineraryModel(
    guideModel,
    'City Tour Ouro Preto',
    spotList7,
    spotDuration,
    sessionsList,
    'Ouro Preto é conhecida pela arquitetura barroca, que inclui pontes, fontes e praças, e pelas ruas calcetadas íngremes e sinuosas. A Praça central de Tiradentes recebeu o nome do mártir da independência brasileira.',
    'CityTour',
    weekdays,
    itineraryAddsList,
    115.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel10 = ItineraryModel(
    guideModel,
    'Rota gastronômica Ouropretana',
    spotList8,
    spotDuration,
    sessionsList,
    'O estado de Minas Gerais é rico em sua gastronomia e nesta experiência teremos a oportunidade de conhecer as tradições, produtores rurais e patrimônio imaterial de Ouro Preto.',
    'Gastronômico',
    weekdays,
    itineraryAddsList,
    295.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel11 = ItineraryModel(
    guideModel,
    'Passeio a praia Morro Branco',
    spotList9,
    spotDuration,
    sessionsList,
    'Morro Branco é uma praia localizada no litoral leste, no município de Beberibe, cerca de 80 km da capital, com uma extensão litorânea de aproximadamente 50 km.\nConhecida pelas belas formações de dunas e berço das areias coloridas entre as falésias, os visitantes se encantam com o trabalho da silicografia (arte de desenhar com areias) realizado pelos artesãos, aproveitando desta beleza natural proveniente das suas falésias, o visitante desfrutará mais da excursão através do passeio opcional de Buggy.',
    'Relax',
    weekdays,
    itineraryAddsList,
    135.00,
    ItineraryType.Guide);
ItineraryModel itineraryModel12 = ItineraryModel(
    guideModel,
    'Passeio na Praia de Cumbuco',
    spotList10,
    spotDuration,
    sessionsList,
    'A Praia de Cumbuco, a cerca de 30 km de carro de Fortaleza, é uma das praias mais procuradas na região metropolitana. Ela está em um vilarejo calmo, com boa estrutura para passar o dia, onde se encontram alguns restaurantes e mar calminho.',
    'Relax',
    weekdays,
    itineraryAddsList,
    90.00,
    ItineraryType.Guide);

ScheduleModel scheduleModel1 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel2 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary2, ScheduleStatus.approved);
ScheduleModel scheduleModel3 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel4 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.pending);
ScheduleModel scheduleModel5 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.pending);

List<ScheduleModel> scheduleList = [scheduleModel1];

List<ItineraryModel> guideItinerariesList = [
  itineraryModel1,
  itineraryModel2,
  itineraryModel4,
  itineraryModel5,
  itineraryModel6,
  itineraryModel7,
  itineraryModel8,
  itineraryModel9,
  itineraryModel10,
  itineraryModel11,
  itineraryModel12
];

var imageUrl1 =
    'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg';
var imageUrl2 = 'https://wallpaperaccess.com/full/797185.png';
var imageUrl3 = 'https://wallpaperaccess.com/full/797185.png';
var imageUrl4 =
    'https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg';
var imageUrl5 =
    'showmetech.com.br/wp-content/uploads//2020/12/nebula-4k-1024x576.jpg';

List<String> imagesUrlList = [
  imageUrl1,
  imageUrl2,
  imageUrl3,
  imageUrl4,
  imageUrl5
];
