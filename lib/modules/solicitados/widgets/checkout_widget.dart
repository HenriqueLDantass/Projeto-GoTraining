import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/solicitados/widgets/delegates/menu_vertical_delegate.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  final menuIsOpen = ValueNotifier<bool>(false);
  @override
  initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  void toggleMenu() {
    menuIsOpen.value ? animation.reverse() : animation.forward();
    menuIsOpen.value = !menuIsOpen.value;
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      clipBehavior: Clip.none,
      delegate: Botoes(animation: animation),
      children: [
        FloatingActionButton(
          heroTag: "B0",
          backgroundColor: ColorsApp.colorItem,
          child: menuIsOpen.value == true
              ? const Icon(Icons.close)
              : const Icon(Icons.add),
          onPressed: () {
            setState(() {
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });
          },
        ),
        FloatingActionButton(
          heroTag: "B1",
          onPressed: () {},
          backgroundColor: Colors.grey,
          child: const Icon(Icons.person),
        ),
        FloatingActionButton(
          heroTag: "B2",
          onPressed: () {},
          backgroundColor: Colors.grey,
          child: const Icon(Icons.share_rounded),
        ),
        FloatingActionButton(
          heroTag: "B3",
          onPressed: () {},
          backgroundColor: Colors.grey,
          child: const Icon(Icons.qr_code),
        ),
        FloatingActionButton(
          heroTag: "B4",
          onPressed: () {},
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.attach_money_rounded),
        ),
        FloatingActionButton(
          heroTag: "B5",
          onPressed: () {},
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.camera_alt_outlined),
        ),
        FloatingActionButton(
          heroTag: "B6",
          onPressed: () {},
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.message_outlined),
        ),
      ],
    );
  }
}
