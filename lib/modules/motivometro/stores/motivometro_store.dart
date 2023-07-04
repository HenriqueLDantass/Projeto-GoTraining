import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MotivometroStore extends ChangeNotifier {
  final List<Map<String, String>> fotosCarrosel = [
    {'image': 'assets/images/muito-motivado.png', 'title': 'Muito Motivado'},
    {'image': 'assets/images/motivado.png', 'title': ' Motivado'},
    {'image': 'assets/images/indiferente.png', 'title': 'Indiferente'},
    {'image': 'assets/images/desmotivado.png', 'title': 'Desmotivado'},
    {'image': 'assets/images/Com-raiva.png', 'title': 'Com Raiva'},
    {'image': 'assets/images/mentindo.png', 'title': 'Mentindo'},
    {'image': 'assets/images/duvida.png', 'title': 'Duvida'},
  ];

  XFile? imagemMotivometro;
  final TextEditingController mensagemMotivometro = TextEditingController();
  selecionarGaleria() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? fileGallery = await picker.pickImage(source: ImageSource.gallery);
      //
      if (fileGallery != null) imagemMotivometro = fileGallery;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  selecionarCamera() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? fileCamera = await picker.pickImage(source: ImageSource.camera);

      //
      if (fileCamera != null) imagemMotivometro = fileCamera;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Imagem de Status'),
          actions: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('ESCOLHER DA GALERIA'),
                  onPressed: () {
                    selecionarGaleria();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('CÂMERA'),
                  onPressed: () {
                    selecionarCamera();
                    Navigator.of(context).pop();
                  },
                ),

                //

                //
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
