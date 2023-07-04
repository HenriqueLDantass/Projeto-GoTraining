import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/agendamento/widgets/title_stepper_widget.dart';
import 'package:gotraining/modules/local/models/remote_models.dart';
import 'package:gotraining/modules/local/stores/local_store.dart';
import 'package:gotraining/modules/local/widgets/info_adicionais.dart';
import 'package:gotraining/modules/local/widgets/textfiel_api_widget.dart';
import 'package:provider/provider.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<LocalPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    final storeLocal = Provider.of<LocalStore>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.colorItem,
        title: const Text(
          "Dados do Local",
        ),
        centerTitle: true,
      ),
      body: Stepper(
        elevation: 2,
        controlsBuilder: storeLocal.currentStep == 0
            ? store.controlLocal
            : storeLocal.currentStep <= 2
                ? store.controlBuilders
                : storeLocal.controlConcluir,
        type: StepperType.vertical,
        physics: const ScrollPhysics(),
        onStepTapped: storeLocal.onStepTapped,
        onStepContinue: storeLocal.continueStep,
        onStepCancel: storeLocal.cancelStep,
        currentStep: storeLocal.currentStep,
        steps: [
          Step(
            title: const TitleStepper(title: "Data e Hora"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Cep:",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextField(
                  controller: storeLocal.cepController,
                  keyboardType: TextInputType.number,
                  onChanged: (cep) {
                    if (cep.length == 8) {
                      setState(() {
                        storeLocal.addressData = storeLocal.fetchAddress(cep);
                      });
                    } else {
                      setState(() {
                        storeLocal.addressData = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                FutureBuilder<CepModel>(
                  future: storeLocal.addressData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Erro detectado: ${snapshot.error}');
                    } else if (snapshot.data == null) {
                      return const TextFielApi();
                    } else {
                      snapshot.data!.bairro;
                      storeLocal.cepController.text = snapshot.data!.cep;
                      storeLocal.bairroController.text = snapshot.data!.bairro;
                      storeLocal.cidadeController.text = snapshot.data!.cidade;
                      storeLocal.estadoController.text = snapshot.data!.estado;
                      return const TextFielApi();
                    }
                  },
                ),
              ],
            ),
            isActive: storeLocal.currentStep >= 0,
            state: storeLocal.currentStep >= 1
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const TitleStepper(title: "Informações adicionais"),
            content: const InfoAdicionais(),
            isActive: storeLocal.currentStep >= 0,
            state: storeLocal.currentStep >= 2
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const TitleStepper(title: "Confirmação"),
            content: const TitleStepper(
                title: 'Gostaraia de confirma a inclusão do agendamento?'),
            isActive: storeLocal.currentStep >= 0,
            state: storeLocal.currentStep >= 3
                ? StepState.complete
                : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
