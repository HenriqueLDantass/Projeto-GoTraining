import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:provider/provider.dart';

class MotivometroCard extends StatelessWidget {
  final String title;
  const MotivometroCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 11, bottom: 11),
          child: Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            child: Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    offset: const Offset(0.3, 2.0),
                  )
                ],
                color: ColorsApp.colorPurpleClaro,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "COMO ESTÀ SE SENTINDO HOJE?",
                      style: TextStyle(
                          fontSize: 18,
                          color: ColorsApp.colorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/pensando.png"),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              store.onItemTapped(3);
            },
          ),
        ),
      ],
    );
  }
}
