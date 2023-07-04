import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class CustomGestureDetectorContent extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isActive;
  final String label;

  const CustomGestureDetectorContent({
    Key? key,
    required this.onTap,
    required this.isActive,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: 130,
            child: Center(
                child: Text(
              label,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isActive ? ColorsApp.colorItem : Colors.white,
            ),
            height: 6,
            width: 120,
          ),
        ],
      ),
    );
  }
}
