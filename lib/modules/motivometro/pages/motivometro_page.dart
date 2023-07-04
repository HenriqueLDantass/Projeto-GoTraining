import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/motivometro/stores/motivometro_store.dart';
import 'package:gotraining/modules/motivometro/widgets/carrosel_widget.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class MotivoMetroPage extends StatefulWidget {
  const MotivoMetroPage({super.key});

  @override
  State<MotivoMetroPage> createState() => _MotivoMetroPageState();
}

class _MotivoMetroPageState extends State<MotivoMetroPage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MotivometroStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Status"),
        centerTitle: true,
        backgroundColor: ColorsApp.colorItem,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, bottom: 15),
              child: Text(
                "Como você está hoje?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const CarroselWidget(),
            const SizedBox(height: 20),
            const Text("Digite uma Mensagem:",
                style: TextStyle(
                  fontSize: 20,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: store.mensagemMotivometro,
              ),
            ),
            const SizedBox(height: 25),
            const Text("Enviar Imagem", style: TextStyle(fontSize: 20)),
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 40),
                  child: SizedBox(
                    height: 120,
                    child: store.imagemMotivometro != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(store.imagemMotivometro!.path),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ))
                        : Image.asset("assets/images/sem-imagens.png"),
                  ),
                ),
                onTap: () => store.dialogBuilder(context)),
            SizedBox(
              height: 38,
              width: 263,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorsApp.colorItem),
                ),
                child: const Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
