import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class CardAvaliacao extends StatelessWidget {
  const CardAvaliacao({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorsApp.colorItem,
                    borderRadius: BorderRadius.circular(15)),
                width: 60,
                height: 60,
                child: const Icon(
                  Icons.lock,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "AVALIAÇÃO DE REAÇÃO TESTE 2?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              '10',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text('min',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            "Tempo de prova",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Text("0",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 30)),
                            SizedBox(
                              width: 80,
                              child: Text(
                                "Quantidade de questões",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Text("0",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 30)),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "Nota de corte",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
