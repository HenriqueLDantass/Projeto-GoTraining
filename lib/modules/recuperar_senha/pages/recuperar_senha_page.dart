import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/core/utils/images/login_images.dart';
import 'package:gotraining/modules/calendar/animation/calendar_animation.dart';
import 'package:gotraining/modules/login/pages/login_page.dart';
import 'package:gotraining/modules/login/stores/login_store.dart';
import 'package:gotraining/modules/login/widgets/logo_custom_widget.dart';
import 'package:gotraining/modules/login/widgets/textfield_custom_widget.dart';
import 'package:gotraining/modules/preload/pages/preload_page.dart';
import 'package:provider/provider.dart';

class RecupeerarSenhaPage extends StatelessWidget {
  const RecupeerarSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          LoginImages.backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.1),
        ),
        Form(
          key: loginStore.formKey,
          child: ListView(children: [
            Column(
              children: [
                const LogoCustom(),
                TextFielCustom(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Incorreto";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 200,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      if (loginStore.verifyLogin(
                          loginStore.usuarioController.text,
                          loginStore.senhaController.text)) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const PreLoadPage()),
                        );
                      }
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "RECUPERAR",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorsApp.colorItem),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CalendarAnimation(
                        builder: (context) => const LoginPage()));
                  },
                  child: const Text("Cancelar e voltar",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
