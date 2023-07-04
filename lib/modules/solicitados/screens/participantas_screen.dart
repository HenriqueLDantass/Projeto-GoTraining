import 'package:flutter/material.dart';
import 'package:gotraining/modules/solicitados/widgets/card_participantes_com_modal.dart';
import 'package:gotraining/modules/solicitados/widgets/card_participantes_widget.dart';

class SolicitadoScreen extends StatefulWidget {
  final String check;
  final String limite;
  final String previsto;
  const SolicitadoScreen({
    super.key,
    required this.check,
    required this.limite,
    required this.previsto,
  });

  @override
  State<SolicitadoScreen> createState() => _SolicitadoScreenState();
}

class _SolicitadoScreenState extends State<SolicitadoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("0 Realizado"),
              Text("${widget.previsto} Previsto"),
              Text("${widget.limite} Limite"),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Text('Cadastre os participantes'),
            ),
            widget.check == "a"
                ? const CardParticipantesComModalWidget()
                : const CardParticipantesWidget()

            //CardPrticipantesWidget(),
          ],
        ),
      ],
    );
  }
}
