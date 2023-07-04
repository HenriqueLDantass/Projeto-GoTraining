// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/card_colors.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:provider/provider.dart';

class HeaderSolicitadoWidget extends StatefulWidget {
  String check;

  HeaderSolicitadoWidget({super.key, required this.check});

  @override
  State<HeaderSolicitadoWidget> createState() => _HeaderSolicitadoWidgetState();
}

class _HeaderSolicitadoWidgetState extends State<HeaderSolicitadoWidget> {
  @override
  Widget build(BuildContext context) {
    final dadosStore = Provider.of<SolicitadosStore>(context);
    return Container(
      height: 135,
      color: widget.check == "c"
          ? CardColors.verde
          : (widget.check == "b" ? CardColors.azul : Colors.black),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  dadosStore.activePage = 0;
                },
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
          Text(
            widget.check == "c"
                ? "Realizado"
                : (widget.check == "b" ? "Confirmado" : "Solicitado"),
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      )),
    );
  }
}
