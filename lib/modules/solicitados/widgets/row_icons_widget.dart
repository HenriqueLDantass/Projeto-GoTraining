import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/card_colors.dart';

// ignore: must_be_immutable
class RowIcons extends StatefulWidget {
  String check;
  DateTime today;
  DateTime calendarioDate;
  RowIcons(
      {super.key,
      required this.check,
      required this.calendarioDate,
      required this.today});

  @override
  State<RowIcons> createState() => _RowIconsState();
}

class _RowIconsState extends State<RowIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.check == "c") {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content:
                        const Text("O treinamento foi realizado com sucesso."),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Fechar"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else if (widget.check == "b" ||
                widget.check == "a" && widget.calendarioDate != widget.today) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Data ou horário fora do programado"),
                    content: const Text(
                        "Verifique se você está realizando o treinamento no dia ou horario correto"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Fechar"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Icon(
            Icons.alarm_rounded,
            color: widget.check == "c"
                ? CardColors.verde
                : (widget.check == "b" && widget.calendarioDate != widget.today
                    ? Colors.yellow
                    : (widget.check == "a" &&
                            widget.calendarioDate != widget.today
                        ? Colors.yellow
                        : Colors.black)),
          ),
        ),
        const Icon(
          Icons.location_on,
        ),
        const Icon(Icons.outlined_flag_sharp),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
