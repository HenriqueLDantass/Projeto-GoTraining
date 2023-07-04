import 'package:flutter/material.dart';
import 'package:gotraining/modules/local/stores/local_store.dart';
import 'package:gotraining/modules/local/widgets/textfiel_widget.dart';
import 'package:provider/provider.dart';

class InfoAdicionais extends StatelessWidget {
  const InfoAdicionais({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LocalStore>(context);
    return TextFielLocal(
      title: 'Observações',
      titleTextFiel: "",
      controller: store.obeservacaoController,
    );
  }
}
