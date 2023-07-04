class Evento {
  int id;
  String titulo;
  String descricao;
  DateTime data;
  String loja;
  String pontos;
  String solicitante;
  String timeInicio;
  String timeTermino;
  String calendario;
  String local;
  String treinamento;
  String cargaHoraria;
  String checking;
  String horario;
  String limiteInscricoessricoes;
  String observacao;
  String publicoPrevistorvisto;
  String tema;

  Evento({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.loja,
    required this.pontos,
    required this.solicitante,
    required this.timeInicio,
    required this.timeTermino,
    required this.calendario,
    required this.local,
    required this.treinamento,
    required this.cargaHoraria,
    required this.checking,
    required this.horario,
    required this.limiteInscricoessricoes,
    required this.observacao,
    required this.publicoPrevistorvisto,
    required this.tema,
  });

  Evento copyWith({
    int? id,
    String? titulo,
    String? descricao,
    DateTime? data,
    String? loja,
    String? pontos,
    String? solicitante,
    String? timeInicio,
    String? timeTermino,
    String? calendario,
    String? local,
    String? treinamento,
    String? cargaHoraria,
    String? checking,
    String? horario,
    String? limiteInscricoessricoes,
    String? observacao,
    String? publicoPrevistorvisto,
    String? tema,
  }) {
    return Evento(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      data: data ?? this.data,
      loja: loja ?? this.loja,
      pontos: pontos ?? this.pontos,
      solicitante: solicitante ?? this.solicitante,
      timeInicio: timeInicio ?? this.timeInicio,
      timeTermino: timeTermino ?? this.timeTermino,
      calendario: calendario ?? this.calendario,
      local: local ?? this.local,
      treinamento: treinamento ?? this.treinamento,
      cargaHoraria: cargaHoraria ?? this.cargaHoraria,
      checking: checking ?? this.checking,
      horario: horario ?? this.horario,
      limiteInscricoessricoes:
          limiteInscricoessricoes ?? this.limiteInscricoessricoes,
      observacao: observacao ?? this.observacao,
      publicoPrevistorvisto:
          publicoPrevistorvisto ?? this.publicoPrevistorvisto,
      tema: tema ?? this.tema,
    );
  }
}
