import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/login/pages/login_page.dart';
import 'package:gotraining/modules/perfil/pages/perfil_page.dart';
import 'package:gotraining/modules/sync/pages/sync_page.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeard(context),
          builItemsMenu(context),
        ],
      ),
    );
  }

  Widget buildHeard(BuildContext context) => Container(
        color: ColorsApp.colorItem,
        height: 210,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const Column(
          children: [
            SizedBox(
              height: 12,
            ),
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('././assets/images/batman.jpg'),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Bruce Wayne",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      );
  Widget builItemsMenu(BuildContext context) => Wrap(
        runSpacing: 5,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Tela inicial",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // colocar tela inicial
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title:
                const Text("Meu Perfil", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PerfilPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.backup_sharp),
            title: const Text(
              "Sync",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SyncPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.door_front_door_outlined),
            title: const Text(
              "Encerrar Sessão",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          Column(
            children: [
              SizedBox(
                width: 180,
                height: 80,
                child: Image.asset('././assets/images/training.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Analytics Dev é um produto Trainig Analytics.',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      );
}
