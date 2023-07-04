import 'package:flutter/material.dart';
import 'package:gotraining/modules/cadastro_reembolso/pages/cadastro_reembolso_page.dart';
import 'package:gotraining/modules/home/widgets/grid_reembolso_widget.dart';

class ReembolsoScreen extends StatefulWidget {
  final String checking;
  const ReembolsoScreen({super.key, required this.checking});

  @override
  State<ReembolsoScreen> createState() => _ReembolsoScreenState();
}

class _ReembolsoScreenState extends State<ReembolsoScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          const GridReembolsoCustom(),
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                child: const Text("Cadastrar despesa"),
                onPressed: () {
                  if (widget.checking == "a") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(""),
                          content:
                              const Text("Faça o Checkout para ter o acesso."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Ok"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CadastroReembolsoPage()));
                  }
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
