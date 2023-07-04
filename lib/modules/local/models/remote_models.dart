class CepModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String estado;

  CepModel(
      {required this.cep,
      required this.logradouro,
      required this.bairro,
      required this.cidade,
      required this.estado});

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
        cep: json['cep'],
        logradouro: json['logradouro'],
        bairro: json['bairro'],
        cidade: json['localidade'],
        estado: json['uf']);
  }
}
