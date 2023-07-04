import 'package:flutter/material.dart';
import 'package:gotraining/modules/perfil/widgets/row_date_widget.dart';
import 'package:gotraining/modules/perfil/widgets/textfiel_widget.dart';
import 'package:gotraining/modules/perfil/widgets/title_perfil_widget.dart';

class DadosItem extends StatelessWidget {
  const DadosItem({super.key});

  @override
  Widget build(BuildContext context) {
    String cpf = "458031118-99";
    TextEditingController cpfController = TextEditingController();
    cpfController.text = cpf;
    return Column(
      children: [
        const TitlePerfilWidget(title: 'Seus Dados'),
        const TextFielPerfil(
          title: 'Email',
          example: 'Exemplo@gmail.com',
        ),
        const RowDate(
          title: 'Telefone',
          example: '(00) 0000-0000',
          secondTitle: 'idade',
        ),
        Row(
          children: [
            //talvez nao seja textfiel?
            Expanded(
              flex: 1,
              child: TextField(
                controller: cpfController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text(
                      "CPF",
                    ),
                    hintText: "00 00 0000-0000"),
              ),
            ),
            const SizedBox(width: 30),
            const Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Data de Nascimento"),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
