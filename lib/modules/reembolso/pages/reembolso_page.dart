import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/home/widgets/grid_reembolso_widget.dart';
import 'package:gotraining/modules/reembolso/stores/reembolso_store.dart';

import 'package:provider/provider.dart';

class ReembolsoPage extends StatefulWidget {
  const ReembolsoPage({super.key});

  @override
  State<ReembolsoPage> createState() => _ReembolsoPageState();
}

class _ReembolsoPageState extends State<ReembolsoPage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ReembolsoStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reembolso"),
        centerTitle: true,
        backgroundColor: ColorsApp.colorItem,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ValueListenableBuilder(
                valueListenable: store.dropValueMes,
                builder: (BuildContext context, String value, _) {
                  return SingleChildScrollView(
                      child: DropdownButton<String>(
                          hint: const Text("Escolha o mês"),
                          value: (value.isEmpty) ? null : value,
                          onChanged: (optionsMes) =>
                              store.dropValueMes.value = optionsMes.toString(),
                          items: store.dropMes
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList()));
                }),
            ValueListenableBuilder(
                valueListenable: store.dropValueAno,
                builder: (BuildContext context, String value, _) {
                  return DropdownButton<String>(
                      hint: const Text("Escolha o ano"),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (optionsMes) =>
                          store.dropValueAno.value = optionsMes.toString(),
                      items: store.dropAno
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList());
                })
          ],
        ),
        const GridReembolsoCustom(),
      ]),
    );
  }
}
