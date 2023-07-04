import 'package:flutter/material.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:gotraining/modules/solicitados/widgets/gestdetecto_widget.dart';
import 'package:provider/provider.dart';

class ScrollTitulo extends StatefulWidget {
  const ScrollTitulo({super.key});

  @override
  State<ScrollTitulo> createState() => _ScrollTituloState();
}

class _ScrollTituloState extends State<ScrollTitulo> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SolicitadosStore>(context);
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0, left: 10, right: 10),
          child: Row(
            children: [
              CustomGestureDetectorContent(
                isActive: store.activePage == 0,
                label: 'PARTICIPANTES',
                onTap: () {
                  setState(() {
                    store.activePage = 0;
                  });
                  store.scroll.animateTo(MediaQuery.of(context).size.width * 0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              CustomGestureDetectorContent(
                isActive: store.activePage == 1,
                label: 'AVALIAÇÕES',
                onTap: () {
                  setState(() {
                    store.activePage = 1;
                  });
                  store.scroll.animateTo(MediaQuery.of(context).size.width * 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              CustomGestureDetectorContent(
                isActive: store.activePage == 2,
                label: 'REEMBOLSO',
                onTap: () {
                  setState(() {
                    store.activePage = 2;
                  });
                  store.scroll.animateTo(MediaQuery.of(context).size.width * 2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              CustomGestureDetectorContent(
                isActive: store.activePage == 3,
                label: 'LOGÍSTICA',
                onTap: () {
                  setState(() {
                    store.activePage = 3;
                  });
                  store.scroll.animateTo(MediaQuery.of(context).size.width * 3,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              CustomGestureDetectorContent(
                isActive: store.activePage == 4,
                label: 'FOTOS',
                onTap: () {
                  setState(() {
                    store.activePage = 4;
                  });
                  store.scroll.animateTo(MediaQuery.of(context).size.width * 4,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              CustomGestureDetectorContent(
                isActive: store.activePage == 5,
                label: 'COMENTARIOS',
                onTap: () {
                  setState(() {
                    store.activePage = 5;
                  });
                  store.scroll.animateTo(MediaQuery.of(context).size.width * 5,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
            ],
          ),
        ));
  }
}
