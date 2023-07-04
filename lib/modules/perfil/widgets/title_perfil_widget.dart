import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class TitlePerfilWidget extends StatelessWidget {
  final String title;
  const TitlePerfilWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 3,
                  height: 30,
                  color: ColorsApp.colorItem,
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
