import 'package:flutter/material.dart';

class BottomModalWidget extends StatefulWidget {
  const BottomModalWidget({super.key});

  @override
  State<BottomModalWidget> createState() => _BottomModalWidgetState();
}

class _BottomModalWidgetState extends State<BottomModalWidget> {
  final _controller = TextEditingController();
  bool envio = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        envio = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "FeedBack do instrutor".toUpperCase(),
                  ),
                ),
                TextField(
                  controller: _controller,
                  maxLength: 500,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe aqui seu feedback ...',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: envio
                          ? () {
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text('Confirmar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
