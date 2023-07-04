import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class CheckboxWidget extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CheckboxWidget({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: widget.isChecked ? ColorsApp.colorItem : Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Checkbox(
                value: widget.isChecked,
                onChanged: widget.onChanged,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.selected)) {
                    return ColorsApp.colorItem;
                  }
                  return Colors.transparent;
                }),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Lembre-me',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
