class SolicitadosModel {
  final String conhecimentoAvaliacao;
  final String reacaoAvalicao;
  final String totalReembolsos;
  final String aprovadoReembolsos;
  final String comentarios;

  SolicitadosModel(
      {required this.aprovadoReembolsos,
      required this.comentarios,
      required this.conhecimentoAvaliacao,
      required this.reacaoAvalicao,
      required this.totalReembolsos});
}
