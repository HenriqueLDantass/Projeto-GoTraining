import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/mocks/agendamento_mock.dart';
import 'package:gotraining/modules/perfil/stores/perfil_store.dart';
import 'package:gotraining/modules/perfil/widgets/dropbutton_custom.dart';
import 'package:gotraining/modules/perfil/widgets/row_date_widget.dart';
import 'package:gotraining/modules/perfil/widgets/textfiel_widget.dart';
import 'package:gotraining/modules/perfil/widgets/title_perfil_widget.dart';
import 'package:provider/provider.dart';

class EnderecoItem extends StatefulWidget {
  const EnderecoItem({super.key});

  @override
  State<EnderecoItem> createState() => _EnderecoItemState();
}

class _EnderecoItemState extends State<EnderecoItem> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PerfilStore>(context);
    return Column(
      children: [
        const TitlePerfilWidget(title: "Endereço"),
        Row(
          children: [
            //talvez nao seja textfiel?

            Expanded(
              flex: 1,
              child: DropButtomCustom(
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
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Cep"),
                ),
              ),
            ),
          ],
        ),
        const TextFielPerfil(
          title: 'Endereço',
          example: 'Av.Paulista',
        ),
        const RowDate(
          title: 'Número',
          secondTitle: 'Complemento',
          example: '',
        ),
        const TextFielPerfil(
          title: 'Bairro',
          example: 'Centro',
        ),
      ],
    );
  }
}
