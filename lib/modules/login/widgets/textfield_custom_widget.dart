import 'package:flutter/material.dart';
import 'package:gotraining/modules/login/stores/login_store.dart';
import 'package:provider/provider.dart';

class TextFielCustom extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  const TextFielCustom({
    super.key,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LoginStore>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Form(
        key: key,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.4),
            hintText: "Usuário",
            hintStyle: const TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
          controller: store.usuarioController,
          validator: validator,
        ),
      ),
    );
  }
}
