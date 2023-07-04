import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/pages/agendamento_page.dart';
import 'package:gotraining/modules/calendar/widgets/delegates/menu_vertical_delegate.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:gotraining/modules/local/pages/local_page.dart';
import 'package:provider/provider.dart';

class MenuButtom extends StatefulWidget {
  const MenuButtom({super.key});

  @override
  State<MenuButtom> createState() => _MenuButtomState();
}

class _MenuButtomState extends State<MenuButtom>
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
    final store = Provider.of<HomeStore>(context);
    return Flow(
      clipBehavior: Clip.none,
      delegate: FabVerticalDelegate(animation: animation),
      children: [
        FloatingActionButton(
          heroTag: "A0",
          backgroundColor: ColorsApp.actionButtonColor,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: animation,
          ),
          onPressed: () => toggleMenu(),
        ),
        FloatingActionButton(
          heroTag: "A1",
          onPressed: () {
            setState(() {
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AgendamentoPage(),
              ),
            );
          },
          backgroundColor: ColorsApp.actionButtonColor,
          child: const Icon(Icons.checklist_rtl_sharp),
        ),
        FloatingActionButton(
          heroTag: "A2",
          onPressed: () {
            setState(() {
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const LocalPage()));
          },
          backgroundColor: ColorsApp.actionButtonColor,
          child: const Icon(Icons.apartment_rounded),
        ),
        FloatingActionButton(
          heroTag: "A3",
          onPressed: () {
            setState(() {
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });
            store.onItemTapped(3);
          },
          backgroundColor: ColorsApp.actionButtonColor,
          child: const Icon(Icons.add_reaction),
        ),
      ],
    );
  }
}
