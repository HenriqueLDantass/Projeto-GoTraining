import 'package:flutter/material.dart';
import 'package:gotraining/modules/local/models/remote_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocalStore extends ChangeNotifier {
  int currentStep = 0;

  //DropBottom
  String? valueLocal;
  final localNotifier = ValueNotifier('');
  final List<String> hospedagemList = [
    'Hotel',
    'Casa',
    'Sala de Treinamento',
    'Parceiro',
  ];
//

  final numeroController = TextEditingController();
  final telefoneController = TextEditingController();
  final celularController = TextEditingController();
  final logradouroController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();
  final cepController = TextEditingController();
  final nomeLocalController = TextEditingController();
  final contatoPessoaController = TextEditingController();
  final emailLocalController = TextEditingController();

  final obeservacaoController = TextEditingController();
  Future<CepModel>? addressData;

  Future<CepModel> fetchAddress(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return CepModel.fromJson(jsonResponse);
    } else {
      throw Exception('Erro ao se conectar');
    }
  }

  continueStep() {
    if (currentStep < 3) {
      currentStep = currentStep + 1;
      notifyListeners();
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      currentStep = currentStep - 1;
      notifyListeners();
    }
  }

  onStepTapped(int value) {
    currentStep = value;
    notifyListeners();
  }

  Widget controlConcluir(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              currentStep = 0;
              Navigator.pop(context);
            },
            child: const Text('Concluir'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: details.onStepCancel,
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
