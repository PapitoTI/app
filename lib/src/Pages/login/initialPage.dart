import 'dart:io';

import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/initial_info_model.dart';
import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class InitialPage extends StatelessWidget {
  final _controller = InitialController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Ceu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                  controller: _controller.pageController,
                  onPageChanged: _controller.selectedPageIndex,
                  itemCount: _controller.initialPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _controller.initialPages[index].title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: EdgeInsets.all(40),
                            child: Image.asset(
                                _controller.initialPages[index].imageAsset),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              _controller.initialPages[index].descri,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: List.generate(
                    _controller.initialPages.length,
                    (index) => Obx(() {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index
                              ? Palette.branco
                              : Palette.cinzaTransparente,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  backgroundColor: Palette.cinzaTransparente,
                  elevation: 0,
                  onPressed: _controller.forwardAction,
                  child: Obx(() {
                    return Text(
                      _controller.ultiPage ? 'Iniciar' : 'Próximo',
                      style: TextStyle(color: Palette.branco, fontSize: 11),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InitialController {
  var selectedPageIndex = 0.obs;
  bool get ultiPage => selectedPageIndex.value == initialPages.length - 1;
  var pageController = PageController();

  forwardAction() async {
    if (ultiPage) {
      var dir = await getTemporaryDirectory();
      var f = File(dir.path + "Tutorial");
      f.writeAsStringSync("xpto");
      Get.to(() => ChoicePage());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<InitialPageInfo> initialPages = [
    InitialPageInfo('assets/images/Athens-amico.png', 'Orion',
        'A Orion conecta pessoas a pessoas, e transforma completamente sua viagem.'),
    InitialPageInfo('assets/images/Tour guide-amico.png', 'Planejando viajar',
        'Planejando viajar? \n\nA Orion tem os melhores roteiros para enriquecer sua viagem! \n\nVocê é Guia turístico? \n\nA Orion é a solução que você busca para oferecer todos os seus roteiros!'),
    InitialPageInfo('assets/images/Around the world-amico.png', 'Você Turista',
        'Se cadastre como Turista, e tenha acesso a um portfólio de diverso roteiros turísticos para diferentes perfis, com os mais distintos preços! \n\nAs viagens realizadas com guias turísticos são ricas de conhecimento cultural, regional e local! \n\nOs melhores lugares com as melhores atividades no seu destino, você encontra aqui!'),
    InitialPageInfo('assets/images/Tour guide-amico.png', 'Você Guia',
        'Se cadastre como Guia e ofereça todo seu conhecimento em roteiros sensacionais! \n\nOs mais diversos tipos de roteiros, com os mais diversos valores! \n\nNa Orion, você gera renda enquanto faz o que ama! \n\nOfereça seu conhecimento e transforme completamente a viagem de diversas pessoas!'),
    InitialPageInfo('assets/images/New York-amico.png', 'Vamos juntos',
        'Preparado pra viver uma experiência única de conexões sem iguais? \n\nEntão cadastre-se, entre e aproveite!'),
  ];
}
