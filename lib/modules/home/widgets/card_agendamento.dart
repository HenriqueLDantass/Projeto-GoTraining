import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/card_colors.dart';
import '../../../datasources/local_data_source.dart';
import '../../calendar/models/calendar_model.dart';

class CardAgenamento extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CardAgenamento({Key? key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    loadEventos() async {
      List<Evento> eventos = await DatabaseHelper.getEventos(today);

      if (eventos.isEmpty) {
        return SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/agenda.png",
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Você não possui treinamentos para hoje.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          final evento = eventos[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: evento.checking == "c"
                          ? CardColors.verde
                          : (evento.checking == "b"
                              ? CardColors.azul
                              : Colors.black),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      )),
                  width: 7,
                  height: 120,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.0,
                            spreadRadius: 3.0,
                            offset: const Offset(0.3, 2.0),
                          )
                        ],
                      ),
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              evento.loja,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${evento.timeInicio} às ${evento.timeTermino}',
                                ),
                                Column(
                                  children: [
                                    const Text("0 Pessoas",
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                    Text(
                                      evento.local,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 110, 109, 109),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tema: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(evento.tema),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return FutureBuilder(
      future: loadEventos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Erro ao carregar os eventos');
        } else {
          return SizedBox(
            height: 170,
            child: snapshot.data as Widget,
          );
        }
      },
    );
  }
}
