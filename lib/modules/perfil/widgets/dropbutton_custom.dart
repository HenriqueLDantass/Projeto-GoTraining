import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropButtomCustom extends StatelessWidget {
  final ValueListenable<String> valueListenable;
  final String? valor;
  final String title;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;

  const DropButtomCustom(
      {super.key,
      required this.valueListenable,
      required this.valor,
      required this.onChanged,
      required this.items,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          ValueListenableBuilder(
            valueListenable: valueListenable,
            builder: (BuildContext context, String value, _) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    isExpanded: true,
                    value: valor,
                    onChanged: onChanged,
                    items: items,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
