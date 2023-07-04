import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/mocks/agendamento_mock.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/agendamento/widgets/data_agenamento.dart';
import 'package:gotraining/modules/agendamento/widgets/dropdown_widget.dart';
import 'package:gotraining/modules/agendamento/widgets/hora_agendamento_widget.dart';
import 'package:provider/provider.dart';

class SteperDataHora extends StatefulWidget {
  const SteperDataHora({super.key});

  @override
  State<SteperDataHora> createState() => _SteperDataHoraState();
}

class _SteperDataHoraState extends State<SteperDataHora> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              DateAgendamento(
                titulo: "Data de inicio",
                controllerData: store.dateCalendarioFormat,
                formatoCalendario: store.formatCalendar,
                globalKey: store.globalKeyDataInicio,
              ),
              HoraAgendamento(
                titulo: "Hora de inicio",
                controller: store.controllerTimeInicio,
                format: store.format,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              DateAgendamento(
                titulo: "Data de Termino",
                controllerData: store.dateCalendarioFormat,
                formatoCalendario: store.formatCalendar,
                globalKey: store.globalKeyDataTermino,
              ),
              HoraAgendamento(
                titulo: "Hora de Termino",
                controller: store.controllerTimeTermino,
                format: store.format,
              ),
            ],
          ),
          ValueDropdownButton(
              title: "TIPO TREINAMENTO :",
              valor: store.valueTreinamento,
              valueListenable: store.tipoTreinamento,
              items: AgendamentoMock.treinamentoTipo
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  store.valueTreinamento = value!;
                });
              },
              globalKey: store.globalKeyTreinamento),
          ValueDropdownButton(
            title: "SOLICITANTE :",
            valor: store.valueSolicitante,
            valueListenable: store.tipoSolicitante,
            items: AgendamentoMock.solicitanteList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                store.valueSolicitante = value!;
              });
            },
            globalKey: store.globalKeySolicitante,
          ),
          ValueDropdownButton(
            title: "BUSINESS CENTER :",
            valor: store.valueBusiess,
            valueListenable: store.tipoBusinessCenter,
            items: AgendamentoMock.businessCenterList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                store.valueBusiess = value!;
              });
            },
            globalKey: store.globalKeyBusinessCenter,
          ),
        ],
      ),
    );
  }
}
