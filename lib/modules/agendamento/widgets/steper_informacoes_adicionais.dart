import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/agendamento/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class SteperInformacoesAdicionais extends StatelessWidget {
  const SteperInformacoesAdicionais({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    return Column(
      children: [
        TextFieldCustom(
          controllerHorarioPrevisto: store.cargaHorariaController,
          controllerLimiteInscricao: store.limiteIncricoesController,
          controllerObservacao: store.observacaoController,
          controllerPontos: store.pontosController,
          controllerPublicoPrevisto: store.publicoPrevistoController,
          titleHorarioPrevisto: "Carga horária prevista",
          titleLimiteInscricao: 'Limite de inscrições',
          titleObservacao: 'Observação',
          titlePontos: 'Pontos',
          titlePublicoPrevisto: 'Público previsto',
          height: 18,
        ),
      ],
    );
  }
}
