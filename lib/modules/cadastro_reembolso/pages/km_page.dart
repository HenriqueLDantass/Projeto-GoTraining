import 'package:flutter/material.dart';
import 'package:gotraining/modules/cadastro_reembolso/stores/cadastro_reembolso_store.dart';
import 'package:gotraining/modules/cadastro_reembolso/widgets/button_custom_km_widget.dart';
import 'package:gotraining/modules/cadastro_reembolso/widgets/textfiel_km.dart';
import 'package:provider/provider.dart';

class KmPage extends StatefulWidget {
  const KmPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KmPageState createState() => _KmPageState();
}

class _KmPageState extends State<KmPage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CadastroReembolsoStore>(context);
    return ListView(children: [
      Column(
        children: [
          TextFielKm(
            title: 'Origem',
            description: 'Exemplo: Av.Paulista, São Paulo',
            controller: store.origemController,
            onChanged: (value) {
              setState(() {
                store.isOrigemFilled = value.isNotEmpty;
              });
            },
          ),
          TextFielKm(
            title: 'Destino',
            description: 'Exemplo:Rua Oscar Freire, São Paulo',
            controller: store.destinoController,
            onChanged: (value) {
              setState(() {
                store.isDestinoFilled = value.isNotEmpty;
              });
            },
          ),
          ButtonKmWidget(
            title: 'Calcular distância',
            onPressed: store.isOrigemFilled && store.isDestinoFilled
                ? () async {
                    store.calculateDistance();
                  }
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: store.distancia),
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: "KM sugerido",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextFielKm(
                    title: 'KM diferente',
                    description: '',
                    onChanged: (value) {
                      setState(() {
                        store.isOrigemFilled = value.isNotEmpty;
                      });
                    },
                    controller: store.controller,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Motivo",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const TextField(
                  maxLength: 500,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
                ButtonKmWidget(
                  title: "Lançar KM",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
