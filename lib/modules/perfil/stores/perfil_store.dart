import 'package:flutter/material.dart';

class PerfilStore extends ChangeNotifier {
  String? valueGenero;
  final generoNotifier = ValueNotifier('');
}
