import 'package:flutter/material.dart';

class Validatos {
  Validatos._();

  static FormFieldValidator nomeLogin(String message) {
    return (value) {
      if (value != "henrique" && value != "123") {
        return message;
      }
      return null;
    };
  }
}
