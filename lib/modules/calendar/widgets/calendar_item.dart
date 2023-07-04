import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/card_colors.dart';
import 'package:gotraining/modules/calendar/animation/calendar_animation.dart';
import 'package:gotraining/modules/solicitados/pages/solicitado_page.dart';
import 'package:gotraining/modules/agendamento/widgets/linha_com_bolinha.dart';

class CalendarItem extends StatefulWidget {
  final dynamic myEvents;
  final String timeInicio;
  final String treinamento;
  final String loja;
  final String timeTermino;
  final String local;
  final String tema;
  final String comentario;
  final int index;
  final String previsto;
  final String calendario;
  final String limite;

  final String check;
  const CalendarItem(
      {super.key,
      this.myEvents,
      required this.timeInicio,
      required this.treinamento,
      required this.loja,
      required this.timeTermino,
      required this.local,
      required this.tema,
      required this.index,
      required this.calendario,
      required this.check,
      required this.comentario,
      required this.limite,
      required this.previsto});

  @override
  State<CalendarItem> createState() => _CalendarItemState();
}

class _CalendarItemState extends State<CalendarItem> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CalendarAnimation(
            builder: (context) => SolicitadoPage(
                index: widget.index,
                calendario: widget.calendario,
                check: widget.check,
                local: widget.local,
                loja: widget.loja,
                tema: widget.tema,
                timeInicio: widget.timeInicio,
                timeTermino: widget.timeTermino,
                treinamento: widget.treinamento,
                comentario: widget.comentario,
                limite: widget.limite,
                previsto: widget.previsto),
          ),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12, right: 3),
            child: SizedBox(
              width: 50,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: [
                    Text(
                      widget.timeInicio,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.treinamento,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const LinhaComBolinha(),
          Container(
            decoration: BoxDecoration(
                color: widget.check == "c"
                    ? CardColors.verde
                    : (widget.check == "b" ? CardColors.azul : Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                )),
            width: 7,
            height: 120,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                      offset: const Offset(0.3, 2.0),
                    )
                  ],
                ),
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.loja,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          if (widget.check == "c")
                            const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.timeInicio} às ${widget.timeTermino}',
                          ),
                          Column(
                            children: [
                              const Text("0 Pessoas",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              Text(
                                widget.local,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 110, 109, 109),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tema: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.tema),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
