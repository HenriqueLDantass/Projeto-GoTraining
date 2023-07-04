import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsApp.colorItem,
          title: const Text("Conteudo a Sincronizar"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Envios'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_shared_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Recursos'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    "NENHUM ENCONTRADO",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("EMOJIS DE STATUS"),
                    ),
                    Text("7/7"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("EMOJIS DE STATUS"),
                    Text("7/7"),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
