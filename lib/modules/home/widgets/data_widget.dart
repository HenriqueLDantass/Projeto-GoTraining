import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DataWiget extends StatefulWidget {
  const DataWiget({super.key});

  @override
  State<DataWiget> createState() => _DataWigetState();
}

class _DataWigetState extends State<DataWiget> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);
    DateFormat horarioFormatando =
        DateFormat('dd MMM yyyy', Platform.localeName);
    String formatadoPadrao = horarioFormatando.format(store.horarioAtual);

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
      child: Text(
        formatadoPadrao,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w300),
      ),
    );
  }
}
