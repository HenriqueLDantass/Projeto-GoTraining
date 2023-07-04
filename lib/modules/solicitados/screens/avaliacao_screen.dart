import 'package:flutter/material.dart';
import 'package:gotraining/modules/solicitados/widgets/card_avalicao.dart';
import 'package:gotraining/modules/solicitados/widgets/grid_custom.dart';

class AvaliacaoScreen extends StatelessWidget {
  const AvaliacaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            GridCustomAvaliacao(
              texto: 'Conhecimento',
              valor: '0,0',
            ),
            GridCustomAvaliacao(
              valor: '0,0',
              texto: 'Reação',
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Avaliações cadastradas",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        const CardAvaliacao(),
      ],
    );
  }
}
