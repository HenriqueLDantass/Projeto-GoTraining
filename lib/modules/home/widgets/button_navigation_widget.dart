import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:gotraining/modules/home/widgets/drawer_custom_widget.dart';
import 'package:provider/provider.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);

    return Scaffold(
      key: store.drawerKey,
      drawer: const Drawer(
        backgroundColor: ColorsApp.colorItem,
        child: DrawerCustom(),
      ),
      body: store.tabs[store.currentIndex],

      //navbar navegacao
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          store.onItemTapped(index);
        },
        currentIndex: store.currentIndex,
        items: const [
          BottomNavigationBarItem(
              label: 'Inicio',
              icon: Icon(
                Icons.home,
              ),
              backgroundColor: ColorsApp.colorItem),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Agenda",
            backgroundColor: ColorsApp.colorItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_rounded),
            label: "Reembolso",
            backgroundColor: ColorsApp.colorItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_sharp),
            label: "Meu Status",
            backgroundColor: ColorsApp.colorItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
            backgroundColor: ColorsApp.colorItem,
          )
        ],
      ),
    );
  }
}
