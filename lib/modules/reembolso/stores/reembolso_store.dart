import 'package:flutter/material.dart';

class ReembolsoStore extends ChangeNotifier {
  final dropValueMes = ValueNotifier('');
  final dropValueAno = ValueNotifier('');

  final List<String> dropMes = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];
  final List<String> dropAno = [
    '2023',
    '2022',
    '2021',
  ];
}
