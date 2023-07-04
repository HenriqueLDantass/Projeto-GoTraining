import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SolicitadosStore extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  TextEditingController documentoController = TextEditingController();
  TextEditingController nomeSobrenomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey key = GlobalKey();
  String? valuePublico;
  final tipoPublico = ValueNotifier('');

  bool camposPreenchidos = false;

  verificarCamposPreenchidos() {
    if (documentoController.text.isNotEmpty &&
        nomeSobrenomeController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      camposPreenchidos = true;
      notifyListeners();
    } else {
      camposPreenchidos = false;
      notifyListeners();
    }
  }

//rever este codigo
  List<File?> imagens = List.filled(6, null);
  final picker = ImagePicker();
  Future getImage(int index) async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagens[index] = File(pickedFile.path);
      notifyListeners();
    }
  }

  void adicionarParticipante(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso!'),
          content: const Text('Participante adicionado com sucesso.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //fotos

  int activePage = 0;
  final ScrollController scroll = ScrollController();
  final List<String> titulos = [
    'titulo 1',
    'titulo 2',
    'titulo 3',
    'titulo 4',
    'titulo 5',
    'titulo 6',
  ];
  final List<String> publicoList = [
    'Zoom 2',
    'Filmes Disney',
    'Conhecimentos Gerais',
    'Customer Sucess',
    'Customer Experience',
    'Qa',
  ];
}
