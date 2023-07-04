import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/adicionar_participante/pages/adicionar_participante_page.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:gotraining/modules/solicitados/widgets/bottom_modal_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/delegates/menu_vertical_delegate.dart';
import 'package:gotraining/modules/treinamento_qrcode/pages/treinamento_qrcode_page.dart';
import 'package:provider/provider.dart';

class FlotingActionButtonCustom extends StatefulWidget {
  final void Function()? onpressed;
  const FlotingActionButtonCustom({super.key, required this.onpressed});

  @override
  State<FlotingActionButtonCustom> createState() =>
      _FlotingActionButtonCustomState();
}

class _FlotingActionButtonCustomState extends State<FlotingActionButtonCustom>
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SolicitadosStore>(context);

    return Flow(
      clipBehavior: Clip.none,
      delegate: Botoes(animation: animation),
      children: [
        FloatingActionButton(
          heroTag: "C01",
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
          heroTag: "C02",
          onPressed: () {
            setState(() {
              store.activePage = 0;
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });
            store.scroll.animateTo(MediaQuery.of(context).size.width * 0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AdicionarParticipante()));
          },
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.person),
        ),
        FloatingActionButton(
          heroTag: "C03",
          onPressed: () {},
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.share_rounded),
        ),
        FloatingActionButton(
          heroTag: "C04",
          onPressed: () {
            setState(() {
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });

            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const TreinamentoQrCode()));
          },
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.qr_code),
        ),
        FloatingActionButton(
          heroTag: "C05",
          onPressed: () {},
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.attach_money_rounded),
        ),
        FloatingActionButton(
          heroTag: "C06",
          onPressed: () {
            // Chamar modal
            int index = store.imagens.indexWhere((image) => image == null);

            if (index >= 0 && index <= 6) {
              store.getImage(index);
            }
          },
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.camera_alt_outlined),
        ),
        FloatingActionButton(
          heroTag: "C07",
          onPressed: () {
            setState(() {
              menuIsOpen.value ? animation.reverse() : animation.forward();
              menuIsOpen.value = !menuIsOpen.value;
            });
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const BottomModalWidget();
                });
          },
          backgroundColor: ColorsApp.colorItem,
          child: const Icon(Icons.message_outlined),
        ),
        FloatingActionButton(
          heroTag: "C08",
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('encerrar o treinamento'),
                  content: const Text(
                      'Deseja informar um numero total de participantes?'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo é obrigatório';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('CANCELAR'),
                        ),
                        TextButton(
                          onPressed: widget.onpressed,
                          child: const Text('CONFIRMAR'),
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.location_on),
        ),
      ],
    );
  }
}
