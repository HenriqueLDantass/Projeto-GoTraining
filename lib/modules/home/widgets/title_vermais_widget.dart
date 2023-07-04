import 'package:flutter/material.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:provider/provider.dart';

class TitleVerMais extends StatelessWidget {
  final String title;
  final int index;
  const TitleVerMais({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          GestureDetector(
            onTap: () {
              store.onItemTapped(index);
            },
            child: const Text("Ver mais", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
