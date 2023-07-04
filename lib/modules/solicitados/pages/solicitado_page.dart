// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/core/utils/colors/card_colors.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/solicitados/widgets/card_grey_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/checkout_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/conteudo_menu.dart';
import 'package:gotraining/modules/solicitados/widgets/flotingacitonbutton_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/header_solicitado.dart';
import 'package:gotraining/modules/solicitados/widgets/row_icons_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/scroll_titulo_widget.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class SolicitadoPage extends StatefulWidget {
  final String loja;
  final String calendario;
  final String timeInicio;
  final String timeTermino;
  final String local;
  final String tema;
  final String treinamento;
  final String comentario;
  final String limite;
  final String previsto;
  final int index;
  String check;
  // ignore: use_key_in_widget_constructors
  SolicitadoPage({
    Key? key,
    required this.loja,
    required this.calendario,
    required this.timeInicio,
    required this.timeTermino,
    required this.local,
    required this.tema,
    required this.treinamento,
    required this.check,
    required this.index,
    required this.comentario,
    required this.limite,
    required this.previsto,
  });

  @override
  State<SolicitadoPage> createState() => _TestePageState();
}

class _TestePageState extends State<SolicitadoPage> {
  @override
  Widget build(BuildContext context) {
    final storeCalendar = Provider.of<AgendamentoStore>(context);
    final eventos = storeCalendar.eventos;
    final evento = widget.index >= 0 && widget.index < eventos.length
        ? eventos[widget.index]
        : null;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateFormat = DateFormat('dd/MM/yyyy');
    final calendarioDate = dateFormat.parse(widget.calendario);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          HeaderSolicitadoWidget(
            check: widget.check,
          ),
          Positioned(
            top: 100,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.loja,
                        style: TextStyle(
                          color: widget.check == "c"
                              ? CardColors.verde
                              : (widget.check == "b"
                                  ? CardColors.azul
                                  : Colors.black),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.calendario} - ${widget.timeInicio.toString()} às ${widget.timeTermino}",
                          ),
                          SizedBox(
                            child: RowIcons(
                              today: today,
                              calendarioDate: calendarioDate,
                              check: widget.check,
                            ),
                          )
                        ],
                      ),
                    ),
                    CardGreyWidget(
                      local: widget.local,
                      tema: widget.tema,
                      treinamento: widget.treinamento,
                    ),
                    const ScrollTitulo(),
                    ConteudoMenu(
                      comentario: widget.comentario,
                      check: widget.check,
                      limite: widget.limite,
                      previsto: widget.previsto,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButton: widget.check == "a"
          ? FloatingActionButton(
              backgroundColor: ColorsApp.colorItem,
              onPressed: () {
                if (widget.check == 'a' && calendarioDate != today) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('AVISO!'),
                        content: const Text(
                            'Você está realizando o Checkout em um dia diferente do programado. Deseja continuar?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('CANCELAR'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                widget.check = "b";
                              });
                              if (evento != null) {
                                storeCalendar.editarEvento(
                                    storeCalendar, evento, widget.check);
                              }
                              Navigator.of(context).pop();
                            },
                            child: const Text('CONTINUAR'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Iniciar Treinamento'),
                        content: const Text(
                            'Deseja confirmar o início do treinamento nesta data e horário?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('CANCELAR'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                widget.check = "b";
                              });
                              if (evento != null) {
                                storeCalendar.editarEvento(
                                    storeCalendar, evento, widget.check);
                              }

                              // localizacao
                              Navigator.of(context).pop();
                            },
                            child: const Text('CONFIRMAR'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Icon(Icons.location_on),
            )
          : widget.check == "b"
              ? FlotingActionButtonCustom(
                  onpressed: () {
                    setState(() {
                      widget.check = "c";
                      storeCalendar.valorChecking++;
                    });
                    if (evento != null) {
                      storeCalendar.editarEvento(
                          storeCalendar, evento, widget.check);
                    }
                    Navigator.of(context).pop();
                  },
                )
              : const Checkout(),
    );
  }
}
