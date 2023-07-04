import 'package:flutter/material.dart';

class TestStore extends ChangeNotifier {
  List<Map<String, dynamic>> lista = [];
  setList(List<Map<String, dynamic>> listItems) {
    lista = listItems;
    notifyListeners();
  }
}
