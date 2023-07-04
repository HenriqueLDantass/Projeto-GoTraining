import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateAgendamento extends StatefulWidget {
  final TextEditingController controllerData;
  final DateFormat formatoCalendario;
  final String titulo;
  final Key? globalKey;
  const DateAgendamento(
      {super.key,
      required this.controllerData,
      required this.formatoCalendario,
      required this.titulo,
      required this.globalKey});

  @override
  State<DateAgendamento> createState() => _DateAgendamentoState();
}

class _DateAgendamentoState extends State<DateAgendamento> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titulo),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Form(
              key: widget.globalKey,
              child: DateTimeField(
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione uma opção.';
                  }
                  return null;
                },
                resetIcon: null,
                controller: widget.controllerData,
                format: widget.formatoCalendario,
                onShowPicker: (context, currentValue) async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null) {
                    widget.controllerData.text =
                        DateFormat(widget.formatoCalendario.toString())
                            .format(selectedDate);
                    store.updateSelectedDay(selectedDate);
                    store.updateFocusedDay(selectedDate);
                  }
                  return selectedDate;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
