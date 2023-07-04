import 'package:flutter/material.dart';
import 'package:gotraining/modules/treinamento_qrcode/widgets/image_qrcode.dart';

class TreinamentoQrCode extends StatelessWidget {
  const TreinamentoQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solicitado"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Text(
                      "Participe do Treinamento",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                child: SizedBox(
                  child: Column(
                    children: [
                      Text(
                        "Peça para o seu aluno apontar a câmera do seu telefone para o Qrcode",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              QrCodeWidget()
            ],
          ),
        ),
      ),
    );
  }
}
