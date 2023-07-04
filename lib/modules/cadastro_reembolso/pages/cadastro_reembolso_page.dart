import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/cadastro_reembolso/pages/km_page.dart';

class CadastroReembolsoPage extends StatelessWidget {
  const CadastroReembolsoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsApp.colorItem,
          title: const Text("Cadastrar Reembolso"),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 25,
                        child:
                            Image.asset("././assets/images/contabilidade.png")),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Despesas'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        child: Image.asset("././assets/images/distancia.png")),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('KM'),
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
            KmPage()
          ],
        ),
      ),
    );
  }
}
