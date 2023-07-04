import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/agendamento/widgets/steper_data_hora_widget.dart';
import 'package:gotraining/modules/agendamento/widgets/steper_informacoes_adicionais.dart';
import 'package:gotraining/modules/agendamento/widgets/steper_local_widget.dart';
import 'package:gotraining/modules/agendamento/widgets/steper_recursos_widget.dart';
import 'package:gotraining/modules/agendamento/widgets/title_stepper_widget.dart';
import 'package:provider/provider.dart';

class AgendamentoPage extends StatefulWidget {
  const AgendamentoPage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<AgendamentoPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            store.currentStep = 0;
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: ColorsApp.colorItem,
        title: const Text(
          "Adicionando Agendamento",
        ),
        centerTitle: true,
      ),
      body: Stepper(
        elevation: 2,
        controlsBuilder: store.currentStep == 0
            ? store.controlLocal
            : store.currentStep <= 3
                ? store.controlBuilders
                : store.controlConcluir,
        type: StepperType.vertical,
        physics: const ScrollPhysics(),
        onStepTapped: store.onStepTapped,
        onStepContinue: store.continueStep,
        onStepCancel: store.cancelStep,
        currentStep: store.currentStep,
        steps: [
          Step(
            title: const TitleStepper(title: "Local"),
            content: const SteperLocal(),
            isActive: store.currentStep >= 0,
            state: store.currentStep >= 0
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const TitleStepper(title: "Data e Hora"),
            content: const SteperDataHora(),
            isActive: store.currentStep >= 0,
            state: store.currentStep >= 1
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const TitleStepper(title: "Recursos Vinculados"),
            content: const StepperRecursos(),
            isActive: store.currentStep >= 0,
            state: store.currentStep >= 2
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const TitleStepper(title: "Informações Adicionais"),
            content: const SteperInformacoesAdicionais(),
            isActive: store.currentStep >= 0,
            state: store.currentStep >= 3
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const TitleStepper(title: "Confirmação"),
            content: const TitleStepper(
                title: 'Gostaraia de confirma a inclusão do agendamento?'),
            isActive: store.currentStep >= 0,
            state: store.currentStep >= 4
                ? StepState.complete
                : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
