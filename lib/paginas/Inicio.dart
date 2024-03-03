

import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../funciones_Adicionales/Item_Bolso.dart';
import '../modelos/Bolso.dart';


class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Bolso> bolsos = listaDeBolsos();
  List<String> imagenesHeroicas = [
    "assets/images/hero1.png",
    "assets/images/hero2.png",
  ];

  final controlador = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 90,
          elevation: 0,
          title: Text("Bolsos",
              style: GoogleFonts.playfairDisplay(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          leading: IconButton(
              iconSize: 40,
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/menu.svg")),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child:
              Image.asset("assets/images/avatar.png", fit: BoxFit.contain),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              carrusel(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bolsos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 230,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 13,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ItemBolso(bolso: bolsos[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: barraDeNavegacion());
  }

  Widget barraDeNavegacion() {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(69)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.home,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.search,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.heart,
              size: 30,
            )),
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.shoppingCart,
                  size: 30,
                )),
            const Positioned(
              right: 1,
              top: 1,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 10,
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget carrusel() {
    return Stack(
      children: [
        CarouselSlider.builder(
            carouselController: controlador,
            itemCount: imagenesHeroicas.length,
            options: CarouselOptions(
                viewportFraction: 1, height: 230, enableInfiniteScroll: true),
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imagenesHeroicas[index]),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          "Lo más reciente \nde la temporada",
                          style: GoogleFonts.playfairDisplay(
                              backgroundColor: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              );
            }),
        Positioned(
          bottom: 1,
          right: 22,
          child: Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: paginaAnterior,
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              const SizedBox(width: 3),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: siguientePagina,
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ))
            ],
          ),
        )
      ],
    );
  }

  void paginaAnterior() {
    controlador.previousPage(duration: const Duration(milliseconds: 400));
  }

  void siguientePagina() {
    controlador.nextPage(duration: const Duration(milliseconds: 400));
  }
}
