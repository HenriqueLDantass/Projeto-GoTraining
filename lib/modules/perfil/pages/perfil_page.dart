import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/mocks/agendamento_mock.dart';
import 'package:gotraining/modules/agendamento/widgets/dropdown_widget.dart';
import 'package:gotraining/modules/perfil/stores/perfil_store.dart';
import 'package:gotraining/modules/perfil/widgets/alterarsenha_item.dart';
import 'package:gotraining/modules/perfil/widgets/card_imagename_widget.dart';
import 'package:gotraining/modules/perfil/widgets/dados_item.dart';
import 'package:gotraining/modules/perfil/widgets/endereco_item.dart';
import 'package:gotraining/modules/perfil/widgets/idioma_item.dart';
import 'package:gotraining/modules/perfil/widgets/title_perfil_widget.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PerfilStore>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.colorItem,
        title: const Text("Meu Perfil"),
        centerTitle: true,
      ),
      body: ListView(children: [
        const CardImageName(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DadosItem(),
              const Text("Ocupação"),
              //
              const TitlePerfilWidget(title: 'Gerente de Treinamento'),
              ValueDropdownButton(
                title: "Escolha o gênero :",
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
              const SizedBox(height: 30),
              //

              const EnderecoItem(),
              //
              const SizedBox(
                height: 25,
              ),
              const IdiomaItem(),
              const AlterarSenhaItem(),
            ],
          ),
        )
      ]),
    );
  }
}
