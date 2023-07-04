import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../modules/calendar/models/calendar_model.dart';

class DatabaseHelper {
  static const String tableName = 'eventos';

  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'eventos.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            titulo TEXT,
            descricao TEXT,
            data INTEGER,
            loja TEXT,
            pontos TEXT,
            solicitante TEXT,
            timeInicio TEXT,
            timeTermino TEXT,
            calendario TEXT,
            local TEXT,
            treinamento TEXT,
            tema TEXT,
            horario TEXT, 
            checking INT, 
            cargaHorario TEXT, 
            limiteInscricoes TEXT, 
            observacao TEXT, 
            publicoPrevisto TEXT
          )
        ''');
      },
    );
  }

  static Future<List<Evento>> getEventos(DateTime date) async {
    final db = await initDatabase();

    final eventos = await db.query(
      tableName,
      where: 'date(data / 1000, "unixepoch") = date(? / 1000, "unixepoch")',
      whereArgs: [date.millisecondsSinceEpoch],
    );

    return eventos
        .map((e) => Evento(
              id: e['id'] as int,
              titulo: e['titulo'] as String,
              descricao: e['descricao'] as String,
              data: DateTime.fromMillisecondsSinceEpoch(e['data'] as int),
              loja: e['loja'] as String,
              pontos: e['pontos'] as String,
              solicitante: e['solicitante'] as String,
              timeInicio: e['timeInicio'] as String,
              timeTermino: e['timeTermino'] as String,
              calendario: e['calendario'] as String,
              local: e['local'] as String,
              treinamento: e['treinamento'] as String,
              cargaHoraria: e['cargaHorario'] as String,
              checking: e['checking'] as String,
              horario: e['horario'] as String,
              limiteInscricoessricoes: e['limiteInscricoes'] as String,
              observacao: e['observacao'] as String,
              publicoPrevistorvisto: e['publicoPrevisto'] as String,
              tema: e['tema'] as String,
            ))
        .toList();
  }

  static Future<void> salvarEvento(Evento evento) async {
    final db = await initDatabase();
    await db.insert(tableName, {
      'id': evento.id,
      'titulo': evento.titulo,
      'descricao': evento.descricao,
      'data': evento.data.millisecondsSinceEpoch,
      'loja': evento.loja,
      'pontos': evento.pontos,
      'solicitante': evento.solicitante,
      'timeInicio': evento.timeInicio,
      'timeTermino': evento.timeTermino,
      'calendario': evento.calendario,
      'local': evento.local,
      'treinamento': evento.treinamento,
      'cargaHorario': evento.cargaHoraria,
      'checking': evento.checking,
      'horario': evento.horario,
      'limiteInscricoes': evento.limiteInscricoessricoes,
      'observacao': evento.observacao,
      'publicoPrevisto': evento.publicoPrevistorvisto,
      'tema': evento.tema,
    });
  }

  static Future<void> removerEvento(int eventoId) async {
    final db = await initDatabase();
    await db.delete(tableName, where: 'id = ?', whereArgs: [eventoId]);
  }

  static Future<void> atualizarEvento(Evento evento) async {
    final db = await initDatabase();
    await db.transaction((txn) async {
      await txn.update(
        tableName,
        {
          'titulo': evento.titulo,
          'descricao': evento.descricao,
          'data': evento.data.millisecondsSinceEpoch,
          'loja': evento.loja,
          'pontos': evento.pontos,
          'solicitante': evento.solicitante,
          'timeInicio': evento.timeInicio,
          'timeTermino': evento.timeTermino,
          'calendario': evento.calendario,
          'local': evento.local,
          'treinamento': evento.treinamento,
          'cargaHorario': evento.cargaHoraria,
          'checking': evento.checking,
          'horario': evento.horario,
          'limiteInscricoes': evento.limiteInscricoessricoes,
          'observacao': evento.observacao,
          'publicoPrevisto': evento.publicoPrevistorvisto,
          'tema': evento.tema,
        },
        where: 'id = ?',
        whereArgs: [evento.id],
      );
    });
  }
}
