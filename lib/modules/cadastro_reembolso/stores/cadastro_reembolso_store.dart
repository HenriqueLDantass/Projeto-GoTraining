import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroReembolsoStore extends ChangeNotifier {
  final origemController = TextEditingController();
  final destinoController = TextEditingController();
  String distancia = '';
  String chaveApi = "AIzaSyBCZc-j-pdaKrNHzXDylcC9XZ9vN6sVyyQ";

  bool isOrigemFilled = false;
  bool isDestinoFilled = false;
  TextEditingController controller = TextEditingController();

  Future<void> calculateDistance() async {
    final url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=${origemController.text}&destinations=${destinoController.text}&key=AIzaSyBCZc-j-pdaKrNHzXDylcC9XZ9vN6sVyyQ';
    final response = await http.get(Uri.parse(url));
    final decodedResponse = json.decode(response.body);

    if (decodedResponse['status'] == 'OK') {
      final distanciaText =
          decodedResponse['rows'][0]['elements'][0]['distance']['text'];

      distancia = distanciaText;
      notifyListeners();
    } else {
      distancia = 'Aconteceu algum erro...';
      notifyListeners();
    }
  }
}
