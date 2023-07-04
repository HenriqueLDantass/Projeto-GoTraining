import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controllerHorarioPrevisto;
  final TextEditingController controllerPontos;
  final TextEditingController controllerLimiteInscricao;
  final TextEditingController controllerPublicoPrevisto;
  final TextEditingController controllerObservacao;
  final String titleHorarioPrevisto;
  final String titlePontos;
  final String titleLimiteInscricao;
  final String titlePublicoPrevisto;
  final String titleObservacao;
  final double? height;
  const TextFieldCustom({
    super.key,
    required this.controllerHorarioPrevisto,
    required this.controllerPontos,
    required this.controllerLimiteInscricao,
    required this.controllerPublicoPrevisto,
    required this.controllerObservacao,
    required this.titleHorarioPrevisto,
    required this.titlePontos,
    required this.titleLimiteInscricao,
    required this.titlePublicoPrevisto,
    required this.titleObservacao,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          controller: controllerHorarioPrevisto,
          decoration: InputDecoration(
            label: Text(titleHorarioPrevisto),
          ),
        ),
        SizedBox(height: height),
        TextField(
          keyboardType: TextInputType.number,
          controller: controllerPontos,
          decoration: InputDecoration(
            label: Text(titlePontos),
          ),
        ),
        SizedBox(height: height),
        TextField(
          keyboardType: TextInputType.number,
          controller: controllerLimiteInscricao,
          decoration: InputDecoration(
            label: Text(titleLimiteInscricao),
          ),
        ),
        SizedBox(height: height),
        TextField(
          keyboardType: TextInputType.number,
          controller: controllerPublicoPrevisto,
          decoration: InputDecoration(
            label: Text(titlePublicoPrevisto),
          ),
        ),
        SizedBox(height: height),
        TextField(
          controller: controllerObservacao,
          decoration: InputDecoration(
            label: Text(titleObservacao),
          ),
        ),
        SizedBox(height: height),
      ],
    );
  }
}
