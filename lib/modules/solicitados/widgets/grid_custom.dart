import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class GridCustomAvaliacao extends StatelessWidget {
  final String valor;
  final String texto;
  const GridCustomAvaliacao({
    super.key,
    required this.valor,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    offset: const Offset(0.3, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: ColorsApp.colorPurpleClaro,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        valor,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.colorWhite),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        texto,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp.colorWhite),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
