import 'package:gotraining/modules/solicitados/models/solicitados_model.dart';

class SolicitadosMock {
  SolicitadosMock();

  Future<List<SolicitadosModel>> get() async {
    List<SolicitadosModel> list = [];
    list.add(SolicitadosModel(
        aprovadoReembolsos: 'Aprovado 10',
        comentarios: 'Comentarios Teste',
        conhecimentoAvaliacao: '100 conhecimento',
        reacaoAvalicao: '10 reações',
        totalReembolsos: '200 reais'));
    return list;
  }
}
