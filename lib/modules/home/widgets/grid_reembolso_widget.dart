import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class GridReembolsoCustom extends StatelessWidget {
  const GridReembolsoCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 70),
                  child: Text(
                    "R\$",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.colorWhite),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "50,00",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.colorWhite),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Aprovado",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: ColorsApp.colorWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
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
              color: ColorsApp.colorItem,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 70),
                  child: Text(
                    "R\$",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.colorWhite),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "170,00",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.colorWhite),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: ColorsApp.colorWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
