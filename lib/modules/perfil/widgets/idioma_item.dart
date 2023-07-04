import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/mocks/agendamento_mock.dart';
import 'package:gotraining/modules/agendamento/widgets/dropdown_widget.dart';
import 'package:gotraining/modules/perfil/stores/perfil_store.dart';
import 'package:gotraining/modules/perfil/widgets/title_perfil_widget.dart';
import 'package:provider/provider.dart';

class IdiomaItem extends StatefulWidget {
  const IdiomaItem({super.key});

  @override
  State<IdiomaItem> createState() => _IdiomaItemState();
}

class _IdiomaItemState extends State<IdiomaItem> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PerfilStore>(context);
    return Column(
      children: [
        const TitlePerfilWidget(title: 'Idioma'),
        ValueDropdownButton(
          title: "Escolha o país :",
          valor: store.valueGenero,
          valueListenable: store.generoNotifier,
          items: AgendamentoMock.generoPerfil
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              store.valueGenero = value!;
            });
          },
          globalKey: null,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Salvar  Alterações"),
          ),
        )
      ],
    );
  }
}
