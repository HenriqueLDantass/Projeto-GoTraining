import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HoraAgendamento extends StatelessWidget {
  final TextEditingController controller;
  final String titulo;
  final DateFormat format;

  const HoraAgendamento(
      {super.key,
      required this.controller,
      required this.format,
      required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo),
          DateTimeField(
            initialValue: DateTime.now().toUtc(),
            resetIcon: null,
            controller: controller,
            format: format,
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.convert(time);
            },
          ),
        ],
      ),
    );
  }
}
