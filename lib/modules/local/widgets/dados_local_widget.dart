import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/widgets/dropdown_widget.dart';
import 'package:gotraining/modules/local/stores/local_store.dart';
import 'package:gotraining/modules/local/widgets/textfiel_widget.dart';
import 'package:provider/provider.dart';

class DadosLocal extends StatefulWidget {
  const DadosLocal({super.key});

  @override
  State<DadosLocal> createState() => _DadosLocalState();
}

class _DadosLocalState extends State<DadosLocal> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LocalStore>(context);
    return Column(
      children: [
        TextFielLocal(
          controller: store.nomeLocalController,
          title: 'Nome do local:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.contatoPessoaController,
          title: 'Pessoa de Contato:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.emailLocalController,
          title: 'Email:',
          titleTextFiel: '',
        ),
        ValueDropdownButton(
          title: "AVALIAÇÂO TREINAMENTO:",
          valor: store.valueLocal,
          valueListenable: store.localNotifier,
          items: store.hospedagemList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              store.valueLocal = value!;
            });
          },
          globalKey: null,
        ),
      ],
    );
  }
}
