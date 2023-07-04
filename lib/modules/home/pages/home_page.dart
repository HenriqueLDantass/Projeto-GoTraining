import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:gotraining/modules/home/widgets/card_agendamento.dart';
import 'package:gotraining/modules/home/widgets/data_widget.dart';
import 'package:gotraining/modules/home/widgets/grid_custom_widget.dart';
import 'package:gotraining/modules/home/widgets/grid_reembolso_widget.dart';
import 'package:gotraining/modules/home/widgets/motivometro_widget.dart';
import 'package:gotraining/modules/home/widgets/stack_custom_widget.dart';
import 'package:gotraining/modules/home/widgets/title_vermais_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePageItem extends StatefulWidget {
  const HomePageItem({super.key});

  @override
  State<HomePageItem> createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  @override
  void initState() {
    super.initState();
    final store = Provider.of<HomeStore>(context, listen: false);
    // store.updateSelectedDay(DateTime.now());
    store.loadEventos();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);
    final storeAgendamento = Provider.of<AgendamentoStore>(context);

    DateFormat mesFormatando = DateFormat('MMM yyyy', Platform.localeName);
    String mesFormatadoPadrao = mesFormatando.format(store.mesAtual);

    return Scaffold(
      body: ListView(children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StackWidget(),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Hoje",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            DataWiget(),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Resumo de Hoje",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
        GridCustom(
          titleContainerFist: "Treinamento",
          titleContainerSecond: "Participantes",
          color: ColorsApp.colorItem,
          numberContainerFirst:
              '${storeAgendamento.valorChecking}/${store.eventos.length}',
          numberContainerSecond: '0',
        ),
        const GridCustom(
          titleContainerFist: "Conhecimento",
          titleContainerSecond: "Reações",
          color: ColorsApp.colorPurpleClaro,
          numberContainerFirst: '0',
          numberContainerSecond: '0',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 3),
          child: TitleVerMais(
            index: 1,
            title: 'Minha agenda',
          ),
        ),
        const CardAgenamento(),
        const MotivometroCard(title: 'Motivometro'),
        Padding(
          padding: const EdgeInsets.only(top: 11, bottom: 11),
          child: TitleVerMais(
              title: " Reembolso - $mesFormatadoPadrao ", index: 2),
        ),
        const GridReembolsoCustom(),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
