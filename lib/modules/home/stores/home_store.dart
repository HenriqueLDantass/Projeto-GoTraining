import 'package:flutter/material.dart';
import 'package:gotraining/datasources/local_data_source.dart';
import 'package:gotraining/modules/calendar/models/calendar_model.dart';
import 'package:gotraining/modules/calendar/pages/calendar_page.dart';
import 'package:gotraining/modules/home/pages/home_page.dart';
import 'package:gotraining/modules/motivometro/pages/motivometro_page.dart';
import 'package:gotraining/modules/reembolso/pages/reembolso_page.dart';
import 'package:intl/intl.dart';

import 'dart:async';

class HomeStore extends ChangeNotifier {
  Timer? timer;
  List<Evento> eventos = [];
  DateTime horarioAtual = DateTime.now();
  final DateFormat horarioFormatando = DateFormat('dd MMM yyyy', "pt_BR");

  DateTime mesAtual = DateTime.now();
  DateFormat mesFormatando = DateFormat('MMM yyyy', "pt_BR");

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  int currentIndex = 0;

  final tabs = [
    const HomePageItem(),
    const CalendarPage(),
    const ReembolsoPage(),
    const MotivoMetroPage(),
  ];
  onItemTapped(int index) {
    if (index == 4) {
      drawerKey.currentState?.openDrawer();
    } else {
      currentIndex = index;
      loadEventos();
      notifyListeners();
    }
  }

  HomeStore() {
    loadEventos();
    startTimer();
  }

  loadEventos() async {
    final DateTime today = DateTime.now();
    eventos = await DatabaseHelper.getEventos(today);
    notifyListeners();
  }

//hora
  void startTimer() {
    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      horarioAtual = DateTime.now();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
