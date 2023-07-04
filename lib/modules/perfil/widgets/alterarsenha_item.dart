import 'package:flutter/material.dart';
import 'package:gotraining/modules/perfil/widgets/title_perfil_widget.dart';

class AlterarSenhaItem extends StatelessWidget {
  const AlterarSenhaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const TitlePerfilWidget(title: 'Alterar Senha'),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              label: Text(
                "Nova senha",
              ),
              hintText: "Digite a nova senha"),
        ),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              label: Text(
                "Confirme a nova senha",
              ),
              hintText: "Digite a nova senha"),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Alterar senha"),
        )
      ],
    );
  }
}
