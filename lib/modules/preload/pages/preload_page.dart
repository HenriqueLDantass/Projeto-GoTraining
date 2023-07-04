import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../home/widgets/button_navigation_widget.dart';

class PreLoadPage extends StatefulWidget {
  const PreLoadPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PreLoadPageState createState() => _PreLoadPageState();
}

class _PreLoadPageState extends State<PreLoadPage> {
  bool carregamento = true;
  var statusConexao = 'Desconhecido';

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<void> checkInternet() async {
    var resultadoConexao = await Connectivity().checkConnectivity();
    if (resultadoConexao == ConnectivityResult.none) {
      setState(() {
        statusConexao = 'Sem conexão com a internet';
        Fluttertoast.showToast(msg: statusConexao);
        carregamento = false;
      });
    } else {
      setState(() {
        statusConexao = 'Conectado com a internet.';
      });
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ButtonNavigation()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: carregamento
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    statusConexao,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkInternet();
                    },
                    child: const Text('Tente novamente'),
                  ),
                ],
              ),
      ),
    );
  }
}
