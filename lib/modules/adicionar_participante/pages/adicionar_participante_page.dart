import 'package:flutter/material.dart';
import 'package:gotraining/modules/adicionar_participante/widgets/textfiel_participantes_widget.dart';
import 'package:gotraining/modules/agendamento/widgets/dropdown_widget.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:provider/provider.dart';

class AdicionarParticipante extends StatefulWidget {
  const AdicionarParticipante({super.key});

  @override
  State<AdicionarParticipante> createState() => _AdicionarParticipanteState();
}

class _AdicionarParticipanteState extends State<AdicionarParticipante> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SolicitadosStore>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar participante"),
        ),
        body: ListView(children: [
          Form(
            key: store.key,
            child: Column(
              children: [
                TextfielParticipantes(
                  controlller: store.documentoController,
                  titulo: 'Documento do Participante',
                ),
                TextfielParticipantes(
                  controlller: store.nomeSobrenomeController,
                  titulo: 'Nome e Sobrenome',
                ),
                TextfielParticipantes(
                  controlller: store.emailController,
                  titulo: 'Email',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ValueDropdownButton(
                    title: "TEMAS DE TREINAMENTO:",
                    valor: store.valuePublico,
                    valueListenable: store.tipoPublico,
                    items: store.publicoList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        store.valuePublico = value!;
                      });
                    },
                    globalKey: null,
                  ),
                ),
                ElevatedButton(
                  onPressed: store.camposPreenchidos
                      ? () => store.adicionarParticipante(context)
                      : null,
                  child: const SizedBox(
                    width: 200,
                    child: Center(
                      child: Text('Adicionar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
