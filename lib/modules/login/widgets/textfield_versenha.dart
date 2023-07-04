import 'package:flutter/material.dart';
import 'package:gotraining/modules/login/stores/login_store.dart';
import 'package:provider/provider.dart';

class TextfielVerSenha extends StatefulWidget {
  final String title;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final Widget? child;
  const TextfielVerSenha({
    super.key,
    required this.controller,
    required this.title,
    this.child,
    required this.validator,
  });

  @override
  State<TextfielVerSenha> createState() => _TextfielVerSenhaState();
}

class _TextfielVerSenhaState extends State<TextfielVerSenha> {
  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Form(
        key: widget.key,
        child: TextFormField(
          obscureText: loginStore.isObscure,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  loginStore.isObscure = !loginStore.isObscure;
                });
              },
              child: Icon(
                loginStore.isObscure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4),
            hintText: widget.title,
            hintStyle: const TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
          validator: widget.validator,
          controller: widget.controller,
        ),
      ),
    );
  }
}
