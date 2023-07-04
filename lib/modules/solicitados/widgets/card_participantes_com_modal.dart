import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class CardParticipantesComModalWidget extends StatelessWidget {
  const CardParticipantesComModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(""),
                    content: const Text("Faça o Checkout para ter o acesso."),
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
            },
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorsApp.colorItem,
                          borderRadius: BorderRadius.circular(15)),
                      width: 60,
                      height: 60,
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "PEQUENOS PÚBLICOS?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 3.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text('Toque no botão adicionar'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 10, left: 10),
                              child: Container(
                                width: 2,
                                height: 40,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 150,
                              child: Text(
                                  "Entregue seu aparelho para o participante"),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(""),
                    content: const Text("Faça o Checkout para ter o acesso."),
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
            },
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorsApp.colorItem,
                          borderRadius: BorderRadius.circular(15)),
                      width: 60,
                      height: 60,
                      child: const Icon(
                        Icons.crop_free_sharp,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'COMPARTILHAR PRESENÇA?',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 3.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 190,
                              child: Text(
                                  'Gerar QRCODE na tela e o aluno apontar a camera em seu telefone'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 5),
                              child: Container(
                                width: 2,
                                height: 30,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(
                              Icons.qr_code,
                              size: 50,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
