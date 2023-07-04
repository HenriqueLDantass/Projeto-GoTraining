import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueDropdownButton extends StatelessWidget {
  final ValueListenable<String> valueListenable;
  final String? valor;
  final String title;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final Key? globalKey;

  const ValueDropdownButton({
    super.key,
    required this.valueListenable,
    required this.valor,
    required this.onChanged,
    required this.items,
    required this.title,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          //
          Form(
            key: globalKey,
            child: ValueListenableBuilder(
                valueListenable: valueListenable,
                builder: (BuildContext context, String value, _) {
                  return SingleChildScrollView(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: valor,
                      elevation: 16,
                      onChanged: onChanged,
                      items: items,
                      validator: (value) {
                        if (value == null) {
                          return 'Campo vazio';
                        }
                        return null;
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
