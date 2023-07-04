import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/mocks/agendamento_mock.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/agendamento/widgets/dropdown_widget.dart';
import 'package:provider/provider.dart';

class StepperRecursos extends StatefulWidget {
  const StepperRecursos({super.key});

  @override
  State<StepperRecursos> createState() => _StepperRecursosState();
}

class _StepperRecursosState extends State<StepperRecursos> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    return Column(
      children: [
        ValueDropdownButton(
          title: "TEMAS DE TREINAMENTO:",
          valor: store.valueTema,
          valueListenable: store.tipoTema,
          items: AgendamentoMock.temaTreinamentoList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              store.valueTema = value!;
            });
          },
          globalKey: null,
        ),
        ValueDropdownButton(
          title: "AVALIAÇÂO TREINAMENTO:",
          valor: store.valueAvaliacao,
          valueListenable: store.tipoAvaliacaoTreinamento,
          items: AgendamentoMock.avaliacaoList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              store.valueAvaliacao = value!;
            });
          },
          globalKey: null,
        ),
        ValueDropdownButton(
          title: "Tipo de Local:",
          valor: store.valueParcerias,
          valueListenable: store.tipoParceiros,
          items: AgendamentoMock.parceirosList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              store.valueParcerias = value!;
            });
          },
          globalKey: null,
        ),
      ],
    );
  }
}
